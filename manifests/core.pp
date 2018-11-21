class perfsonar::core {
  include 'perfsonar::core::install'
  include 'perfsonar::testpoint'
  # components that are not configured but use puppet to ensure the service is running
  include 'perfsonar::cassandra'
  # nothing else is needed here for core, the only other service that's installed is esmond
  # and this is running within apache, so we don't need an additional service watcher
}
