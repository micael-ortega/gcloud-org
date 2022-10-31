provider "google" {
  project     = "micael-devops-iac"
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = file("serviceaccount.yaml")
}

# Garante a criação das pastas em "Comercial"

resource "google_folder" "Comercial" {
  display_name = "Comercial"
  parent       = "organizations/789114887016"
}

resource "google_folder" "Mobile" {
  display_name = "Mobile"
  parent       = google_folder.Comercial.name
}

resource "google_folder" "Mobile-Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.Mobile.name
}

resource "google_folder" "Mobile-Producao" {
  display_name = "Producao"
  parent       = google_folder.Mobile.name
}

resource "google_folder" "erp" {
  display_name = "ERP"
  parent       = google_folder.Comercial.name
}

resource "google_folder" "ERP-Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.erp.name
}

resource "google_folder" "ERP-Producao" {
  display_name = "Producao"
  parent       = google_folder.erp.name
}

# Garante criação dos projetos 

resource "google_project" "micael-comercial-mobile-dev" {
  name                = "mobile-Dev"
  project_id          = "micael-comercial-mobile-dev"
  folder_id           = google_folder.Mobile-Desenvolvimento.name
  auto_create_network = false
  billing_account     = "01846E-0D07AE-76F61E"

} 

resource "google_project" "micael-comercial-mobile-prod" {
  name                = "Mobile-Prod"
  project_id          = "micael-comercial-mobile-prod"
  folder_id           = google_folder.Mobile-Producao.name
  auto_create_network = false
  billing_account     = "01846E-0D07AE-76F61E"

}

resource "google_project" "micael-comercial-erp-dev" {
  name                = "ERP-Dev"
  project_id          = "micael-comercial-erp-dev"
  folder_id           = google_folder.ERP-Desenvolvimento.name
  auto_create_network = false
  billing_account     = "01846E-0D07AE-76F61E"

}

resource "google_project" "micael-comercial-erp-prod" {
  name                = "ERP-prof"
  project_id          = "micael-comercial-erp-prod"
  folder_id           = google_folder.ERP-Producao.name
  auto_create_network = false
  billing_account     = "01846E-0D07AE-76F61E"

}


# Definição da pasta Financeiro

resource "google_folder" "Financeiro" {
  display_name = "Financeiro"
  parent       = "organizations/789114887016"
}

resource "google_folder" "Salesforce" {
  display_name = "Salesforce"
  parent       = google_folder.Financeiro.name
}

resource "google_folder" "Salesforce-Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.Salesforce.name
}

resource "google_folder" "Salesforce-Producao" {
  display_name = "Producao"
  parent       = google_folder.Salesforce.name
}

# Garante criação dos projetos 

resource "google_project" "micael-financeiro-salesforce-dev" {
  name                = "Salesforce-Dev"
  project_id          = "micael-financeiro-salesforce-dev"
  folder_id           = google_folder.Salesforce-Desenvolvimento.name
  auto_create_network = false
  billing_account     = "01846E-0D07AE-76F61E"

}   

resource "google_project" "micael-financeiro-salesforce-prod" {
  name                = "Salesforce-Prod"
  project_id          = "micael-financeiro-salesforce-prod"
  folder_id           = google_folder.Salesforce-Producao.name
  auto_create_network = false
  billing_account     = "01846E-0D07AE-76F61E"

}

# Definição da pasta Recursos Humanos

resource "google_folder" "RecursosHumanos" {
  display_name = "Recursos Humanos"
  parent       = "organizations/789114887016"
}

resource "google_folder" "HRMS" {
  display_name = "Mobile"
  parent       = google_folder.RecursosHumanos.name
}

resource "google_folder" "HRMS-Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.HRMS.name
}

resource "google_folder" "HRMS-Producao" {
  display_name = "Producao"
  parent       = google_folder.HRMS.name
}

# Garante criação dos projetos 

resource "google_project" "micael-rh-hrms-dev" {
  name                = "HRMS-Dev"
  project_id          = "micael-rh-hrms-dev"
  folder_id           = google_folder.HRMS-Desenvolvimento.name
  auto_create_network = false
  billing_account     = "01846E-0D07AE-76F61E"

}   

resource "google_project" "micael-rh-hrms-prod" {
  name                = "HRMS-Prod"
  project_id          = "micael-rh-hrms-prod"
  folder_id           = google_folder.HRMS-Producao.name
  auto_create_network = false
  billing_account     = "01846E-0D07AE-76F61E"

}