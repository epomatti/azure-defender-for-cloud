output "linux_public_ip" {
  value = var.create_vm_linux == true ? module.vm_linux[0].public_ip : ""
}

output "windows_public_ip" {
  value = var.create_vm_windows == true ? module.vm_windows[0].public_ip : ""
}
