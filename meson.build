project('xyz.gelez.switchboard-terminal-plug', 'vala', 'c', version: '0.1.0')

plug_name = 'terminal'
plug_category = 'personal'
plug_title = 'Terminal'
plug_description = 'Customize elementary Terminal'
plug_icon = 'utilities-terminal'

config = configuration_data()
config.set('plug_name', plug_name)
config.set('code_name', meson.project_name())
config.set('plug_category', plug_category)
config.set('plug_title', plug_title)
config.set('plug_description', plug_description)
config.set('plug_icon', plug_icon)
config.set('gettext_package', meson.project_name())
plug_file = configure_file(input: 'plug.plugin', output: 'plug.plugin', configuration: config)
config_vala = configure_file(input: 'Config.vala', output: 'Config.vala', configuration: config)

destdir = join_paths(get_option('prefix'), get_option('libdir'), 'switchboard', 'personal', meson.project_name())

install_data(plug_file, install_dir: destdir)

add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name()), language:'c')

library(
  meson.project_name(),
  files(
    'src/Plug.vala',
    'src/Settings.vala',
    join_paths('@0@'.format(config_vala))
  ),
  dependencies: [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('gtk+-3.0'),
    dependency('switchboard-2.0'),
    dependency('granite')
  ],
  install: true,
  install_dir: destdir
)

# subdir('po')
