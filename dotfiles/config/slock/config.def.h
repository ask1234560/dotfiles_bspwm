/* user and group to drop privileges to */
static const char *user  = "ananthu";
static const char *group = "ananthu";

static const char *colorname[NUMCOLS] = {
	[INIT]     =  "#000000",   /* after initialization */
	[INPUT]    =  "#282c34",   /* during input */
	[FAILED]   =  "#be5046"    /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 0;
