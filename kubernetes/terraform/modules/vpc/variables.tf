variable source_ranges {
  description = "Allowed IP addresses"
  default     = ["0.0.0.0/0"]
}

variable k8s_ports {
  description = "Allowed k8s ports"
  default     = ["30000-32767"]
}

variable k8s_protocol {
  description = "Allowed k8s protocol"
  default     = "tcp"
}
