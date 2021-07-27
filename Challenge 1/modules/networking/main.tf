resource "azurerm_virtual_network" "vnet01" {
  name                = "vnet01"
  resource_group_name = var.resource_group
  location            = var.location
  address_space       = [var.vnetcidr]
}

resource "azurerm_subnet" "web-subnet" {
  name                 = "web-subnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.websubnetcidr]
}

resource "azurerm_subnet" "app-subnet" {
  name                 = "app-subnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.appsubnetcidr]
}

resource "azurerm_subnet" "db-subnet" {
  name                 = "db-subnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.dbsubnetcidr]
}

resource "azurerm_public_ip" "public_ip" {
  name                = "public_ip"
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = "Static"

  tags = {
    environment = "development"
  }
}

resource "azurerm_subnet" "frontend" {
  name                 = "frontend"
  resource_group_name  = var.resource_group
  virtual_network_name = var.location
  address_prefixes     = [var.frontendsubnet]
}

resource "azurerm_subnet" "backend" {
  name                 = "backend"
  resource_group_name  = var.resource_group
  virtual_network_name = var.location
  address_prefixes     = [var.backendsubnet]
}


