provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  version = "2.5.0"
  features {} 
  environment = "public"
}

variable "rglocation" {
  description = "rgloc"
  default = "eastus"
}

variable "rgname" {
  description = "rgname"
  default = "rgroup"
}

variable "key" {
  description = "public_key"
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA3T7bYMERbTYX65OmxnUmlPBacAbG9e3BuZA7y3GbVtKMfRfAHKA1jTygKrlE6Pvsz+aaI6RNhuzTzPR9S9lADg9iYNlc4+AuffuDTILl754E4dKo22xpTcalRdUXggAX1kvkUZ8DXIl5CGsYHGjHTS/YITn8UQzG4Si8KgMbU7BcjNRxOaIcjvFdV4EXa4M/WwX8AV76zs+WxlsjzIo4P0Tf3Sy40v/hYpDk3XO7hAHyZMOfCDqU7CwRuPw76STiM+mcOZfSrZi9DCkbZNNuiDzsJhzTyQUmRha6vYVWeuWcFp/h0DW5m2jlGmj2MmYQ9NMX3jKNPvHT0YP8P0FFCw== rsa-key-20200410"
}

variable "subscription_id" {
  description = "sub_id"
  default = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

variable "client_id" {
  description = "client_id"
  default = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

variable "client_secret" {
  description = "client_secret"
  default = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

variable "tenant_id" {
  description = "tenant_id"
  default = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

