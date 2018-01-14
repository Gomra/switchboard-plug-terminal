/*
*  Copyright (C) 2018 Baptiste Gelez
*
*  This program is free software: you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation, either version 3 of the License, or
*  (at your option) any later version.
*
*  This program is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*  GNU General Public License for more details.
*
*  You should have received a copy of the GNU General Public License
*  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

public class Terminal.Plug : Switchboard.Plug {
    public Settings settings { get; set; }
    public Gtk.Grid main_grid { get; set; }

    public Plug () {
        Object (category: Category.PERSONAL, code_name: Config.CODENAME, display_name: _(Config.DISPLAY_NAME), description: _(Config.DESCRIPTION), icon: Config.ICON);
    }

    public override Gtk.Widget get_widget () {
        settings = new Settings ();

        main_grid = make_grid ();
        main_grid.margin = 24;
        main_grid.width_request = 400;

        var style_section = make_section ("Style", 0);

        var dark_switch = new Gtk.Switch ();
        settings.bind_property ("prefer-dark-style", dark_switch, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
        setting ("Dark theme:", dark_switch, 1, style_section);

        var background_color = new Gtk.ColorButton ();
        background_color.use_alpha = true;
        settings.bind_property ("background", background_color, "rgba", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL, str_to_color, color_to_str);
        setting ("Background color:", background_color, 2, style_section);

        var cursor_color = new Gtk.ColorButton ();
        cursor_color.use_alpha = true;
        settings.bind_property ("cursor-color", cursor_color, "rgba", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL, str_to_color, color_to_str);
        setting ("Cursor color:", cursor_color, 3, style_section);

        var behavior = make_section ("Behavior", 10);

        var remember_tabs = new Gtk.Switch ();
        settings.bind_property ("remember-tabs", dark_switch, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
        setting ("Remember opened tabs:", remember_tabs, 1, behavior);

        var shell_path = new Gtk.Entry ();
        shell_path.placeholder_text = "Let it empty for Bash";
        settings.bind_property ("shell", shell_path, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
        setting ("Shell:", shell_path, 2, behavior);

        return main_grid;
    }

    private bool color_to_str (Binding b, Value src, ref Value res) {
        debug ("calling color to str");
        var color = (Gdk.RGBA) src;
        res = color.to_string ();
        return true;
    }

    private bool str_to_color (Binding b, Value src, ref Value res) {
        debug ("calling str to color");
        var color = Gdk.RGBA ();
        var success = color.parse ((string) src);
        res = color;
        return success;
    }

    public override void shown () {
        main_grid.show_all ();
    }

    public override void hidden () {
        main_grid.hide ();
    }

    public override async Gee.TreeMap<string, string> search (string search) {
        var search_results = new Gee.TreeMap<string, string> ();
        return search_results;
    }

    public override void search_callback (string location) {
    }

    private Gtk.Grid make_section (string label, int pos) {
        var section = make_grid ();
        section.halign = Gtk.Align.FILL;
        section.column_homogeneous = true;

        section.attach (title (label), 0, 0, 1, 1);
        main_grid.attach (section, 0, pos, 1, 1);
        return section;
    }

    private Gtk.Grid make_grid () {
        var grid = new Gtk.Grid ();
        grid.halign = Gtk.Align.CENTER;
        grid.column_spacing = 12;
        grid.row_spacing = 12;
        return grid;
    }

    private Gtk.Label title (string text) {
        var title = new Gtk.Label (text);
        title.get_style_context ().add_class ("h4");
        title.halign = Gtk.Align.START;
        return title;
    }

    private void setting (string description, Gtk.Widget widget, int pos, Gtk.Grid section) {
        var label = new Gtk.Label (description);
        label.halign = Gtk.Align.END;
        label.margin_left = 12;
        section.attach (label, 0, pos);

        widget.halign = Gtk.Align.START;
        section.attach (widget, 2, pos);
    }
}

public Switchboard.Plug get_plug (Module module) {
    return new Terminal.Plug ();
}
