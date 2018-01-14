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
    public Plug () {
        Object (category: Category.PERSONAL, code_name: Config.CODENAME, display_name: _(Config.DISPLAY_NAME), description: _(Config.DESCRIPTION), icon: Config.ICON);
    }

    public override Gtk.Widget get_widget () {
        var grid = new Gtk.Grid ();
        grid.add (new Gtk.Label ("Hey !"));
        return grid;
    }

    public override void shown () {
        //main_grid.show ();
    }

    public override void hidden () {
        //main_grid.hide ();
    }

    public override void search_callback (string location) {
    }

    // 'search' returns results like ("Keyboard → Behavior → Duration", "keyboard<sep>behavior")
    public override async Gee.TreeMap<string, string> search (string search) {
        var search_results = new Gee.TreeMap<string, string> ((GLib.CompareDataFunc<string>)strcmp, (Gee.EqualDataFunc<string>)str_equal);
        search_results["%s → %s".printf (display_name, _("System Information"))] = "";
        search_results["%s → %s".printf (display_name, _("Restore Default Settings"))] = "";
        search_results["%s → %s".printf (display_name, _("Suggest Translation"))] = "";
        search_results["%s → %s".printf (display_name, _("Report Problems"))] = "";
        search_results["%s → %s".printf (display_name, _("Updates"))] = "";
        return search_results;
    }
}

public Switchboard.Plug get_plug (Module module) {
    return new Terminal.Plug ();
}
