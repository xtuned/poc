output "admin_password" {
  value =  {
    for k, v in aws_instance.this: k => v.get_password_data  ? rsadecrypt(v.password_data,tls_private_key.this.private_key_pem) : "Password Not Set"
  }
  sensitive = true
}

output "public_ip_address" {
  value = {
    for k,v in aws_instance.this: k => v.public_ip
  }
}