{ config, pkgs, ... }: {
	
	home.file.".config/nwg-dock-hyprland/style.css".text = ''

		window {
		    background: rgba(17, 17, 27, 0.8); 
		    border-radius: 30px;
		    border-bottom: 10px solid transparent;
		    /* margin: 0px 12px; */
		}

		button {
		    padding: 6px;
		    padding-top: 8px;
		    margin: 0 6px;
		    margin-top: 3px;
		    background: transparent;
		    border: none;
        outline: none;
        box-shadow: none;
		    transition: all 0.2s ease-in-out;
		}

		button:hover {
		    padding-top: 2px;
		    background: transparent;
        outline: none;
        box-shadow: none;
		}

		#active-dot {
		    background-color: #89b4fa;
		}
	'';
}
