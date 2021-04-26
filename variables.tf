variable region {
    description = "São Paulo"
    default = "sa-east-1"
}

variable "name" {
    description = "MBA TerraForm MySQL"
    default = "servermba01"
}

variable "env" {
    description = "Ambiente da aplicação"
    default = "prod"
}

variable "ami" {
    description = "AWS AMI que será utilizada"
    default = "ami-0c27c96aaa148ba6d"
}

variable "instance_type" {
    description = "Instância que será utilizada"
    default = "t2.micro"
}