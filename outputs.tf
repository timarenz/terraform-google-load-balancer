output "target_pool_self_link" {
  value = google_compute_target_pool.main.self_link
}

output "public_ip" {
  value = google_compute_forwarding_rule.main.ip_address
}
