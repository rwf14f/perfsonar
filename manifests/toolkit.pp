class perfsonar::toolkit {
  include 'perfsonar::toolkit::install'
  include 'perfsonar::core'
  include 'perfsonar::ls_cache_daemon'
}

# additional deps:
#nagios-plugins-all.x86_64
#nscd.x86_64
#perfsonar-graphs.noarch
#perfsonar-lscachedaemon.noarch
#perfsonar-nagios-plugins-all.noarch
#perfsonar-psconfig-publisher.noarch
#perfsonar-toolkit-systemenv.noarch
#perl-aliased.noarch
#perl-AnyEvent-HTTP.noarch
#perl-AnyEvent.x86_64
#perl-Readonly.noarch
#perl-XML-Twig.noarch
#tcptrace.x86_64
#uuid-perl.x86_64
#xplot-tcptrace.x86_64
