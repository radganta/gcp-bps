provider "google" {
	project = "ixvm-261016"
	region = "us-central1"
	zone = "us-central1-a"
}

resource "google_compute_firewall" "GCP_MGMT_FIREWALL_RULE" {
	name = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_MGMT_FIREWALL_RULE_NAME}"
	allow {
		protocol = "tcp"
		ports = var.GCP_MGMT_FIREWALL_RULE_PORTS
	}
	direction = var.GCP_MGMT_FIREWALL_RULE_DIRECTION
	disabled = "false"
	network = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_MGMT_VPC_NETWORK_NAME}"
	priority = var.GCP_MGMT_FIREWALL_RULE_PRIORITY
	source_ranges = var.GCP_MGMT_FIREWALL_RULE_SOURCE_IP_RANGES
	target_tags = var.GCP_MGMT_FIREWALL_RULE_NETWORK_TARGET_TAGS
}

resource "google_compute_firewall" "GCP_CONSOLE_FIREWALL_RULE" {
	name = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_CONSOLE_FIREWALL_RULE_NAME}"
	allow {
		protocol = "tcp"
		ports = var.GCP_CONSOLE_FIREWALL_RULE_PORTS
	}
	direction = var.GCP_CONSOLE_FIREWALL_RULE_DIRECTION
	disabled = "false"
	network = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_MGMT_VPC_NETWORK_NAME}"
	priority = var.GCP_CONSOLE_FIREWALL_RULE_PRIORITY
	source_ranges = var.GCP_CONSOLE_FIREWALL_RULE_SOURCE_IP_RANGES
	target_tags = var.GCP_CONSOLE_FIREWALL_RULE_NETWORK_TARGET_TAGS
}

resource "google_compute_firewall" "GCP_CONTROL_FIREWALL_RULE" {
	name = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_CONTROL_FIREWALL_RULE_NAME}"
	allow {
		protocol = var.GCP_CONTROL_FIREWALL_RULE_PORTS
	}
	direction = var.GCP_CONTROL_FIREWALL_RULE_DIRECTION
	disabled = "false"
	network = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_MGMT_VPC_NETWORK_NAME}"
	priority = var.GCP_CONTROL_FIREWALL_RULE_PRIORITY
	source_tags = var.GCP_CONTROL_FIREWALL_RULE_SOURCE_TAGS
	target_tags = var.GCP_CONTROL_FIREWALL_RULE_TARGET_TAGS
}

resource "google_compute_firewall" "GCP_TEST1_FIREWALL_RULE" {
	name = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_TEST1_FIREWALL_RULE_NAME}"
	allow {
		protocol = var.GCP_TEST1_FIREWALL_RULE_PORTS
	}
	direction = var.GCP_TEST1_FIREWALL_RULE_DIRECTION
	disabled = "false"
	network = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_TEST1_VPC_NETWORK_NAME}"
	priority = var.GCP_TEST1_FIREWALL_RULE_PRIORITY
	source_ranges = var.GCP_TEST1_FIREWALL_RULE_SOURCE_IP_RANGES
	source_tags = var.GCP_TEST1_FIREWALL_RULE_SOURCE_TAGS
	target_tags = var.GCP_TEST1_FIREWALL_RULE_TARGET_TAGS
}

resource "google_compute_firewall" "GCP_TEST2_FIREWALL_RULE" {
	name = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_TEST2_FIREWALL_RULE_NAME}"
	allow {
		protocol = var.GCP_TEST2_FIREWALL_RULE_PORTS
	}
	direction = var.GCP_TEST2_FIREWALL_RULE_DIRECTION
	disabled = "false"
	network = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_TEST2_VPC_NETWORK_NAME}"
	priority = var.GCP_TEST2_FIREWALL_RULE_PRIORITY
	source_ranges = var.GCP_TEST2_FIREWALL_RULE_SOURCE_IP_RANGES
	source_tags = var.GCP_TEST2_FIREWALL_RULE_SOURCE_TAGS
	target_tags = var.GCP_TEST2_FIREWALL_RULE_TARGET_TAGS
}

resource "google_compute_address" "GCP_VCONTROLLER_IFACE_ETH0_PUBLIC_IP_ADDRESS" {
	name = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_VCONTROLLER_IFACE_ETH0_PUBLIC_IP_ADDRESS_NAME}"
	region = var.GCP_REGION_NAME
	network_tier = "PREMIUM"
	address_type = "EXTERNAL"
}

resource "google_compute_instance" "GCP_VCONTROLLER_INSTANCE" {
	name = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_VCONTROLLER_INSTANCE_NAME}"
	can_ip_forward = var.GCP_VCONTROLLER_CAN_IP_FORWARD
	zone = var.GCP_ZONE_NAME
	machine_type = "zones/${var.GCP_ZONE_NAME}/machineTypes/${var.GCP_VCONTROLLER_MACHINE_TYPE}"
	boot_disk {
		device_name = "persistent-disk-0"
		auto_delete = "true"
		initialize_params {
			image = "projects/${var.GCP_VCONTROLLER_CUSTOM_IMAGE_PROJECT_NAME}/global/images/family/${var.GCP_VCONTROLLER_CUSTOM_IMAGE_FAMILY_NAME}"
		}
	}
	network_interface {
		network = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_MGMT_VPC_NETWORK_NAME}"
		subnetwork = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_MGMT_SUBNET_NAME}"
		access_config {
			nat_ip = google_compute_address.GCP_VCONTROLLER_IFACE_ETH0_PUBLIC_IP_ADDRESS.address
			network_tier = "PREMIUM"
		}
	}
	metadata = {
		Owner = var.GCP_OWNER_TAG
		Project = var.GCP_PROJECT_TAG
		Options = var.GCP_OPTIONS_TAG
		serial-port-enable = var.GCP_VCONTROLLER_SERIAL_PORT_ENABLE
	}
	tags = var.GCP_VCONTROLLER_NETWORK_TARGET_TAGS
	labels = {
		owner = replace(replace(var.GCP_OWNER_TAG, ".", "-"), "@", "-")
		project = lower(var.GCP_PROJECT_TAG)
		options = lower(var.GCP_OPTIONS_TAG)
	}
}

resource "google_compute_address" "GCP_VBLADE_IFACE_ETH0_PUBLIC_IP_ADDRESS" {
	name = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_VBLADE_IFACE_ETH0_PUBLIC_IP_ADDRESS_NAME}"
	region = var.GCP_REGION_NAME
	network_tier = "PREMIUM"
	address_type = "EXTERNAL"
}

resource "google_compute_instance" "GCP_VBLADE_INSTANCE" {
	name = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_VBLADE_INSTANCE_NAME}"
	can_ip_forward = var.GCP_VBLADE_CAN_IP_FORWARD
	zone = var.GCP_ZONE_NAME
	machine_type = "zones/${var.GCP_ZONE_NAME}/machineTypes/${var.GCP_VBLADE_MACHINE_TYPE}"
	boot_disk {
		device_name = "persistent-disk-0"
		auto_delete = "true"
		initialize_params {
			image = "projects/${var.GCP_VBLADE_CUSTOM_IMAGE_PROJECT_NAME}/global/images/family/${var.GCP_VBLADE_CUSTOM_IMAGE_FAMILY_NAME}"
		}
	}
	network_interface {
		network = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_MGMT_VPC_NETWORK_NAME}"
		network_ip = var.GCP_VBLADE_IFACE_ETH0_PRIVATE_IP_ADDRESS
		subnetwork = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_MGMT_SUBNET_NAME}"
		access_config {
			nat_ip = google_compute_address.GCP_VBLADE_IFACE_ETH0_PUBLIC_IP_ADDRESS.address
			network_tier = "PREMIUM"
		}
	}
	network_interface {
		network = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_TEST1_VPC_NETWORK_NAME}"
		network_ip = var.GCP_VBLADE_IFACE_ETH1_PRIVATE_IP_ADDRESS
		subnetwork = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_TEST1_SUBNET_NAME}"
		access_config {
			network_tier = "PREMIUM"
		}
		alias_ip_range {
			ip_cidr_range = var.GCP_VBLADE_IFACE_ETH1_PRIVATE_IP_ALIASES
		}
	}
	network_interface {
		network = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_TEST2_VPC_NETWORK_NAME}"
		network_ip = var.GCP_VBLADE_IFACE_ETH2_PRIVATE_IP_ADDRESS
		subnetwork = "${var.GCP_LOGIN_ID_TAG}-${var.GCP_PROJECT_TAG}-${var.GCP_TEST2_SUBNET_NAME}"
		access_config {
			network_tier = "PREMIUM"
		}
		alias_ip_range {
			ip_cidr_range = var.GCP_VBLADE_IFACE_ETH2_PRIVATE_IP_ALIASES
		}
	}
	metadata = {
		Owner = var.GCP_OWNER_TAG
		Project = var.GCP_PROJECT_TAG
		Options = var.GCP_OPTIONS_TAG
		serial-port-enable = var.GCP_VBLADE_SERIAL_PORT_ENABLE
	}
	tags = var.GCP_VBLADE_NETWORK_TARGET_TAGS
	labels = {
		owner = replace(replace(var.GCP_OWNER_TAG, ".", "-"), "@", "-")
		project = lower(var.GCP_PROJECT_TAG)
		options = lower(var.GCP_OPTIONS_TAG)
	}
}