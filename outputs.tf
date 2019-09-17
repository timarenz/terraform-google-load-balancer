output "self_link" {
  value = google_compute_firewall.main.self_link
}

output "public_ip" {
  value = google_compute_forwarding_rule.main.ip_address
}
