/* user and group to drop privileges to */
static const char *user  = "ananthu";
static const char *group = "ananthu";

static const char *colorname[NUMCOLS] = {
	[INIT]     =  "#000000",   /* after initialization */
	[INPUT]    =  "#282c34",   /* during input */
	[FAILED]   =  "#be5046",   /* wrong password */
	[CAPS]     =  "#005577",   /* CapsLock on */
};

/* lock screen opacity */
static const float alpha = 0.5;

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 0;

/* default message */
static const char * message = "Enter password to unlock";

/* text color */
static const char * text_color = "#abb2bf";

/* text size (must be a valid size) */
static const char * font_name = "-microsoft-consolas-bold-i-normal--0-0-0-0-m-0-iso8859-10";
