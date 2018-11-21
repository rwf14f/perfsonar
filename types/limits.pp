type Perfsonar::Limits = Struct[{
  name                      => String,
  Optional[parent]          => String,
  Optional[bandwidth]       => Variant[String, Integer],
  Optional[disk]            => Variant[String, Integer],
  Optional[delete_on_fetch] => Enum['on', 'off'],
  Optional[allow_open_mode] => Enum['on', 'off'],
  Optional[test_sessions]   => Integer,
}]
