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
namespace Terminal {
    public enum CursorShape {
        BLOCK = 0,
        IBEAM = 1,
        UNDERLINE = 2
    }

    public class Settings : Granite.Services.Settings {
        public int scrollback_lines { get; set; }
        public bool follow_last_tab { get; set; }
        public bool remember_tabs { get; set; }
        public bool alt_changes_tab { get; set; }
        public bool audible_bell { get; set; }
        public bool natural_copy_paste { get; set; }
        public bool prefer_dark_style { get; set; }
        public bool unsafe_paste_alert { get; set; }

        public string foreground { get; set; }
        public string background { get; set; }
        public string cursor_color { get; set; }
        public CursorShape cursor_shape { get; set; }
        public string palette { get; set; }

        public string shell { get; set; }
        public string encoding { get; set; }
        public string font { get; set; }
        public bool allow_bold { get; set; }
        public bool save_exited_tabs { get; set; }
        public Granite.Widgets.DynamicNotebook.TabBarBehavior tab_bar_behavior { get; set; }

        public Settings () {
            base ("io.elementary.terminal.settings");
        }
    }
}
