terraform {
	cloud {
          
          organization = "Cloud-Prime-Services"

          workspaces {
              project = "AWS-test"

              name = "Get-Started2"

          }

	}

   required_providers{
      aws = {
       source = "hashicorp/aws"
       version = "~> 5.92"

      }


   }
        required_version = ">= 1.2"

}