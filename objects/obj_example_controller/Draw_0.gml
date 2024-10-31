//Render a form
var form = html_form(undefined, "registration-form");
html_h3(form, "header", "Log in")
html_field(form, "email", "email", "Emailaddress", true, "", "test@example.com");
html_field(form, "password", "password", "Password", true);
html_submit(form, "submit", "Login", !form_is_loading, form_is_loading ? "loading" : "");
if html_element_interaction(form)
html_submit_code(form)

//Render a scrollable div containing a link and a sprite
var scrollable = html_div(undefined, "scrollable", undefined, "scrollable");
var p = html_p(scrollable, "link-container", undefined)
html_span(p, "link-prefix", "You can add nested elements and a ")
var link = html_link(p, "link", "link")
if html_element_interaction(link)
show_message("Well done!")
html_span(p, "link-suffix", ". Go ahead, try to click me!") 
html_p(scrollable, "explanation", "You can easily add images and let the browser handle the overflow for you.")
html_sprite(scrollable, "logo", sprite_logo, 0);

//Render a div following the cursor
var xx = window_mouse_get_x();
var yy = window_mouse_get_y();
html_element(
	undefined, 
	"tooltip", 
	"div", 
	"content", "Your mouse position is "+string(xx)+", "+string(yy), 
	"style", "top: "+string(yy)+"px; left: "+string(xx + 20)+"px;"
);

//Render a div with fancy css
html_div(undefined, "styled", "Unleash the power of CSS!");
