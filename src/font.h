

#ifndef FONT_H
#  define FONT_H


#include "opengl.h"


/*
 * Font info
 */
typedef struct {
	int h; /* height */
	int* w;
	GLuint *textures;
	GLuint list_base;
} glFont;
extern glFont gl_defFont; /* default font */


/*
 * glFont loading / freeing
 *
 * if font is NULL it uses the internal default font same with gl_print
 */
void gl_fontInit( glFont* font, const char *fname, const unsigned int h );
void gl_freeFont( glFont* font );


/* prints text normally */
void gl_print( const glFont *ft_font, const double x, const double y,
		const glColour *c, const char *fmt, ... );
/* prints text to a max length */
int gl_printMax( const glFont *ft_font, const int max,
		const double x, const double y,
		const glColour *c, const char *fmt, ... );
/* prints text centered in width at x */
int gl_printMid( const glFont *ft_font, const int width,
		double x, const double y,
		const glColour* c, const char *fmt, ... );
/* gets the width of the text wanting to be printed */
int gl_printWidth( const glFont *ft_font, const char *fmt, ... );


#endif /* FONT_H */

