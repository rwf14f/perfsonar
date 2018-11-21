class perfsonar::testpoint {
  include 'perfsonar::testpoint::install'
  # components that are configured by puppet
  include 'perfsonar::psconfig::pscheduler'
  include 'perfsonar::ls_registration_daemon'
  include 'perfsonar::owamp'
  include 'perfsonar::twamp'
  # components that are not configured but use puppet to ensure the service is running
  include 'perfsonar::pscheduler'
  include 'perfsonar::apache'
  include 'perfsonar::postgresql'
}
