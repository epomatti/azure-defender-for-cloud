output "linux_public_ip" {
  value = var.create_vm ? module.vm.public_ip : null
}
