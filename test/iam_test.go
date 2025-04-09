package test

import (
	"testing"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/iam"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestIAMRoleExists(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "../", // path to your Terraform root module
		// Vars if needed:
		// Vars: map[string]interface{}{
		// 	"app_id": "123",
		// 	"cost_string": "456",
		// },
	}

	// Destroy infra after test finishes
	//defer terraform.Destroy(t, terraformOptions)

	// Init and apply
	terraform.InitAndApply(t, terraformOptions)

	// Output the role name from Terraform
	roleName := terraform.Output(t, terraformOptions, "role_name") // Ensure `output "role_name"` is defined in your Terraform code

	// Create a new AWS session in default region or specify
	sess := session.Must(session.NewSession(&aws.Config{
		Region: aws.String("ap-south-1"),
	}))

	iamClient := iam.New(sess)

	// Call AWS IAM GetRole API
	roleOutput, err := iamClient.GetRole(&iam.GetRoleInput{
		RoleName: aws.String(roleName),
	})

	// Validate the role exists and matches name
	assert.NoError(t, err)
	assert.Equal(t, roleName, *roleOutput.Role.RoleName)
}
