output "location" {
  description = "The Azure region"
  value       = var.deploy_location
}

output "Compute_Gallery" {
  description = "Azure Compute Gallery"
  value       = azurerm_shared_image_gallery.sig.name
}