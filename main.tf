terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.63.0"
    }
  }
}
resource "tfe_project" "CliProject" { #change name as per your needs and organization name to match the one you have created in the portal
  name         = "CliProject"
  organization = "TechnicalAssessmentHCP"
}
resource "tfe_workspace" "TestWorkspace" {
  name         = "TestWorkspace"
  organization = "TechnicalAssessmentHCP"
  project_id   = tfe_project.CliProject.id
}
resource "tfe_workspace" "TestWorkspace2" {
  name         = "TestWorkspace2"
  organization = "TechnicalAssessmentHCP"
  project_id   = tfe_project.CliProject.id
}
resource "tfe_workspace" "TestWorkspace3" {
  name         = "TestWorkspace3"
  organization = "TechnicalAssessmentHCP"
  project_id   = tfe_project.CliProject.id
}

resource "tfe_oauth_client" "ClientAuth" {
  organization     = "TechnicalAssessmentHCP" 
  api_url          = "https://api.github.com"
  http_url         = "" #input the url for the repo
  oauth_token      = "" #you should input a value of your generated API token for acces to your Github repo
  service_provider = "github"
}
resource "tfe_workspace" "VCSworkspaceTest" {
  name         = "VCSworkspaceTest"
  organization = "TechnicalAssessmentHCP"
  project_id   = tfe_project.CliProject.id
  vcs_repo {
    branch         = "main"
    identifier     = "" # input : owner name/repo name
    oauth_token_id = tfe_oauth_client.ClientAuth.oauth_token_id
  }
}
