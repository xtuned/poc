output "admin_password" {
  value = rsadecrypt(aws_instance.this.password_data,tls_private_key.this.private_key_pem )
  sensitive = true
}

output "public_ip_address" {
  value = aws_instance.this.public_ip
}