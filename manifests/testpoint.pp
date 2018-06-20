class perfsonar::testpoint {
  include 'perfsonar::testpoint::install'
  # components that are configured by puppet
  include 'perfsonar::ls_registration_daemon'
  include 'perfsonar::mesh_config'
  # components that are not configured but use puppet to ensure the service is running
  include 'perfsonar::pscheduler'
  include 'perfsonar::bwctl'
  include 'perfsonar::owamp'
  include 'perfsonar::apache'
  include 'perfsonar::postgresql'
}
