terraform {
required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.63.0"
    }
  }
}
resource "tfe_project" "CliProject" {
  name = "CliProject"
  organization = "TechnicalAssessmentHCP"
}
resource "tfe_workspace" "TestWorkspace" {
  name = "TestWorkspace"
  organization = "TechnicalAssessmentHCP"
  project_id = tfe_project.CliProject.id
}
resource "tfe_workspace" "TestWorkspace2" {
  name = "TestWorkspace2"
  organization = "TechnicalAssessmentHCP"
  project_id = tfe_project.CliProject.id

}
resource "tfe_workspace" "TestWorkspace3" {
  name = "TestWorkspace3"
  organization = "TechnicalAssessmentHCP"
  project_id = tfe_project.CliProject.id
}