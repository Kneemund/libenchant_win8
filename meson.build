project('enchant_win8', 'cpp',
  version: '0.1.0',
  default_options: [
    'warning_level=2',
    'cpp_std=c++11',
  ],
)

# Windows COM libraries
win_libs = [
  meson.get_compiler('cpp').find_library('ole32'),
  meson.get_compiler('cpp').find_library('oleaut32'),
  meson.get_compiler('cpp').find_library('uuid'),
]

# Windows API version flags (Windows 8+ required for Spell Checking API)
win_version_flags = [
  '-D_WIN32_WINNT=_WIN32_WINNT_WIN8',
  '-DNTDDI_VERSION=NTDDI_WIN8',
]

# Build shared module
shared_module('enchant_win8',
  'src' / 'win8_provider.cpp',
  dependencies: [
    dependency('glib-2.0'),
    dependency('enchant-2'),
    win_libs
  ],
  include_directories: include_directories('enchant' / 'lib'), # enchant-provider.h
  cpp_args: win_version_flags,
  name_prefix: '',
  install: true,
  install_dir: get_option('libdir') / 'enchant-2',
)
