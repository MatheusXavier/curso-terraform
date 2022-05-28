resource "null_resource" "processospowershel" {

  provisioner "local-exec" {
    command = "Get-Process > lista.txt"
    interpreter = [
      "Powershell", "-Command"
    ]
  }

}
