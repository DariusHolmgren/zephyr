#!/usr/bin/env bash
# Copyright 2021 Nordic Semiconductor
# SPDX-License-Identifier: Apache-2.0

source $(dirname "${BASH_SOURCE[0]}")/../../_mesh_test.sh

RunTest mesh_provision_pb_adv_oob_auth \
	prov_device_pb_adv_oob_auth prov_provisioner_pb_adv_oob_auth
