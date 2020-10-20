variable "GCP_PROJECT_NAME" {
	type = string
	default = "ixvm-261016"
}

variable "GCP_REGION_NAME" {
	type = string
	default = "us-central1"
}

variable "GCP_ZONE_NAME" {
	type = string
	default = "us-central1-a"
}

variable "GCP_OWNER_TAG" {
	type = string
	default = "gcp-bps@google.com"
}

variable "GCP_LOGIN_ID_TAG" {
	type = string
	default = "gcp-bps"
}

variable "GCP_PROJECT_TAG" {
	type = string
	default = "open-ixia-gcp-bps"
}

variable "GCP_OPTIONS_TAG" {
	type = string
	default = "MANUAL"
}

variable "GCP_MGMT_VPC_NETWORK_NAME" {
	type = string
	default = "management-vpc-network"
}

variable "GCP_MGMT_SUBNET_NAME" {
	type = string
	default = "management-subnet"
}

variable "GCP_MGMT_SUBNET_IP_RANGE" {
	type = string
	default = "10.0.10.0/24"
}

variable "GCP_MGMT_FIREWALL_RULE_NAME" {
	type = string
	default = "management-firewall-rule"
}

variable "GCP_MGMT_FIREWALL_RULE_DIRECTION" {
	type = string
	default = "INGRESS"
}

variable "GCP_MGMT_FIREWALL_RULE_PRIORITY" {
	type = number
	default = "1000"
}

variable "GCP_MGMT_FIREWALL_RULE_PORTS" {
	type = list(string)
	default = [
		"22",
		"80",
		"443"
	]
}

variable "GCP_MGMT_FIREWALL_RULE_NETWORK_TARGET_TAGS" {
	type = list(string)
	default = [
		"bps-vcontroller",
		"bps-vblade"
	]
}

variable "GCP_MGMT_FIREWALL_RULE_SOURCE_IP_RANGES" {
	type = list(string)
	default = [
		"42.42.42.42/32"
	]
}

variable "GCP_CONSOLE_FIREWALL_RULE_NAME" {
	type = string
	default = "gcp-console-firewall-rule"
}

variable "GCP_CONSOLE_FIREWALL_RULE_DIRECTION" {
	type = string
	default = "INGRESS"
}

variable "GCP_CONSOLE_FIREWALL_RULE_PRIORITY" {
	type = number
	default = "1001"
}

variable "GCP_CONSOLE_FIREWALL_RULE_PORTS" {
	type = list(string)
	default = [
		"22"
	]
}

variable "GCP_CONSOLE_FIREWALL_RULE_NETWORK_TARGET_TAGS" {
	type = list(string)
	default = [
		"bps-vcontroller",
		"bps-vblade"
	]
}

variable "GCP_CONSOLE_FIREWALL_RULE_SOURCE_IP_RANGES" {
	type = list(string)
	default = [
		"35.190.247.0/24",
		"35.191.0.0/16",
		"64.233.160.0/19",
		"66.102.0.0/20",
		"66.249.80.0/20",
		"72.14.192.0/18",
		"74.125.0.0/16",
		"108.177.8.0/21",
		"108.177.96.0/19",
		"130.211.0.0/22",
		"172.217.0.0/19",
		"172.217.32.0/20",
		"172.217.128.0/19",
		"172.217.160.0/20",
		"172.217.192.0/19",
		"172.253.56.0/21",
		"172.253.112.0/20",
		"173.194.0.0/16",
		"209.85.128.0/17",
		"216.58.192.0/19",
		"216.239.32.0/19"
	]
}

variable "GCP_CONTROL_FIREWALL_RULE_NAME" {
	type = string
	default = "control-firewall-rule"
}

variable "GCP_CONTROL_FIREWALL_RULE_DIRECTION" {
	type = string
	default = "INGRESS"
}

variable "GCP_CONTROL_FIREWALL_RULE_PRIORITY" {
	type = number
	default = "1003"
}

variable "GCP_CONTROL_FIREWALL_RULE_PORTS" {
	type = string
	default = "all"
}

variable "GCP_CONTROL_FIREWALL_RULE_SOURCE_TAGS" {
	type = list(string)
	default = [
		"bps-vcontroller",
		"bps-vblade"
	]
}

variable "GCP_CONTROL_FIREWALL_RULE_TARGET_TAGS" {
	type = list(string)
	default = [
		"bps-vcontroller",
		"bps-vblade"
	]
}

variable "GCP_TEST1_VPC_NETWORK_NAME" {
	type = string
	default = "test-01-vpc-network"
}

variable "GCP_TEST1_SUBNET_NAME" {
	type = string
	default = "test-01-subnet"
}

variable "GCP_TEST1_SUBNET_IP_RANGE" {
	type = string
	default = "10.0.2.0/24"
}

variable "GCP_TEST1_FIREWALL_RULE_NAME" {
	type = string
	default = "test-01-firewall-rule"
}

variable "GCP_TEST1_FIREWALL_RULE_DIRECTION" {
	type = string
	default = "INGRESS"
}

variable "GCP_TEST1_FIREWALL_RULE_PRIORITY" {
	type = number
	default = "1000"
}

variable "GCP_TEST1_FIREWALL_RULE_PORTS" {
	type = string
	default = "all"
}

variable "GCP_TEST1_FIREWALL_RULE_SOURCE_IP_RANGES" {
	type = list(string)
	default = [
		"10.0.2.0/24",
		"10.0.3.0/24"
	]
}

variable "GCP_TEST1_FIREWALL_RULE_SOURCE_TAGS" {
	type = list(string)
	default = [
		"bps-vblade"
	]
}

variable "GCP_TEST1_FIREWALL_RULE_TARGET_TAGS" {
	type = list(string)
	default = [
		"bps-vblade"
	]
}

variable "GCP_TEST1_VPC_NETWORK_PEER_NAME" {
	type = string
	default = "test-01-vpc-network-peer"
}

variable "GCP_TEST2_VPC_NETWORK_NAME" {
	type = string
	default = "test-02-vpc-network"
}

variable "GCP_TEST2_FIREWALL_RULE_NAME" {
	type = string
	default = "test-02-firewall-rule"
}

variable "GCP_TEST2_FIREWALL_RULE_DIRECTION" {
	type = string
	default = "INGRESS"
}

variable "GCP_TEST2_FIREWALL_RULE_PRIORITY" {
	type = number
	default = "1000"
}

variable "GCP_TEST2_FIREWALL_RULE_PORTS" {
	type = string
	default = "all"
}

variable "GCP_TEST2_FIREWALL_RULE_SOURCE_IP_RANGES" {
	type = list(string)
	default = [
		"10.0.2.0/24",
		"10.0.3.0/24"
	]
}

variable "GCP_TEST2_FIREWALL_RULE_SOURCE_TAGS" {
	type = list(string)
	default = [
		"bps-vblade"
	]
}

variable "GCP_TEST2_FIREWALL_RULE_TARGET_TAGS" {
	type = list(string)
	default = [
		"bps-vblade"
	]
}

variable "GCP_TEST2_SUBNET_NAME" {
	type = string
	default = "test-02-subnet"
}

variable "GCP_TEST2_SUBNET_IP_RANGE" {
	type = string
	default = "10.0.3.0/24"
}

variable "GCP_TEST2_VPC_NETWORK_PEER_NAME" {
	type = string
	default = "test-02-vpc-network-peer"
}

variable "GCP_VCONTROLLER_INSTANCE_NAME" {
	type = string
	default = "bps-vcontroller-01"
}

variable "GCP_VCONTROLLER_SERIAL_PORT_ENABLE" {
	type = string
	default = "true"
}

variable "GCP_VCONTROLLER_CAN_IP_FORWARD" {
	type = string
	default = "false"
}

variable "GCP_VCONTROLLER_CUSTOM_IMAGE_PROJECT_NAME" {
	type = string
	default = "ixvm-261016"
}

variable "GCP_VCONTROLLER_CUSTOM_IMAGE_FAMILY_NAME" {
	type = string
	default = "ixia-breakingpoint-virtual-controller-9-10-110-update1"
}

variable "GCP_VCONTROLLER_MACHINE_TYPE" {
	type = string
	default = "n1-standard-4"
}

variable "GCP_VCONTROLLER_IFACE_ETH0_PUBLIC_IP_ADDRESS_NAME" {
	type = string
	default = "bps-vcontroller-01-eth0-ip-addr"
}

variable "GCP_VCONTROLLER_NETWORK_TARGET_TAGS" {
	type = list(string)
	default = [
		"bps-vcontroller"
	]
}

variable "GCP_VBLADE_INSTANCE_NAME" {
	type = string
	default = "bps-vblade-01"
}

variable "GCP_VBLADE_SERIAL_PORT_ENABLE" {
	type = string
	default = "true"
}

variable "GCP_VBLADE_CAN_IP_FORWARD" {
	type = string
	default = "true"
}

variable "GCP_VBLADE_CUSTOM_IMAGE_PROJECT_NAME" {
	type = string
	default = "ixvm-261016"
}

variable "GCP_VBLADE_CUSTOM_IMAGE_FAMILY_NAME" {
	type = string
	default = "ixia-breakingpoint-virtual-blade-9-10-110-update1"
}

variable "GCP_VBLADE_MACHINE_TYPE" {
	type = string
	default = "c2-standard-8"
}

variable "GCP_VBLADE_IFACE_ETH0_PRIVATE_IP_ADDRESS" {
	type = string
	default = "10.0.10.11"
}

variable "GCP_VBLADE_IFACE_ETH0_PUBLIC_IP_ADDRESS_NAME" {
	type = string
	default = "bps-vblade-01-eth0-ip-addr"
}

variable "GCP_VBLADE_IFACE_ETH1_PRIVATE_IP_ADDRESS" {
	type = string
	default = "10.0.2.15"
}

variable "GCP_VBLADE_IFACE_ETH1_PRIVATE_IP_ALIASES" {
	type = string
	default = "/28"
}

variable "GCP_VBLADE_IFACE_ETH2_PRIVATE_IP_ADDRESS" {
	type = string
	default = "10.0.3.15"
}

variable "GCP_VBLADE_IFACE_ETH2_PRIVATE_IP_ALIASES" {
	type = string
	default = "/28"
}

variable "GCP_VBLADE_NETWORK_TARGET_TAGS" {
	type = list(string)
	default = [
		"bps-vblade"
	]
}