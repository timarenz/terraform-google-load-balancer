resource "google_compute_forwarding_rule" "main" {
  project               = var.project
  name                  = var.name
  region                = var.region
  target                = google_compute_target_pool.main.self_link
  load_balancing_scheme = var.load_balancing_scheme
  port_range            = var.service_port
}

resource "google_compute_target_pool" "main" {
  project          = var.project
  name             = var.name
  region           = var.region
  session_affinity = var.session_affinity
  instances        = var.instances

  health_checks = [
    google_compute_http_health_check.main.name
  ]
}

resource "google_compute_http_health_check" "main" {
  project      = var.project
  name         = "${var.name}-hc"
  request_path = "/"
  port         = var.service_port
}

resource "google_compute_firewall" "main" {
  project = var.project
  name    = "${var.name}-lb"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = [var.service_port]
  }

  source_ranges = var.source_ranges
  target_tags   = var.target_tags
}
