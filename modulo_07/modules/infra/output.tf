output "app-service-url" {
  value = azurerm_windows_web_app.webapp.default_hostname
}
