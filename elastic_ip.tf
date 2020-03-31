resource "aws_eip" "web_eip" {
  instance = aws_instance.web.id
  vpc      = true

  tags = {
    Name = "${var.project_name}-eip"
  }
}