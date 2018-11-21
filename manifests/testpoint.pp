class perfsonar::testpoint {
  include 'perfsonar::testpoint::install'
  # components that are configured by puppet
  include 'perfsonar::psconfig::pscheduler'
  include 'perfsonar::ls_registration_daemon'
  # components that are not configured but use puppet to ensure the service is running
  include 'perfsonar::pscheduler'
  include 'perfsonar::owamp'
  include 'perfsonar::apache'
  include 'perfsonar::postgresql'
}

# perfsonar-lsregistrationdaemon
# perfsonar-psconfig-pscheduler
# perfsonar-tools
# => iperf*, ntp, owamp-*, twamp-*
# pscheduler-bundle-full
