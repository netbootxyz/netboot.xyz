#ifndef CONFIG_COLOUR_H
#define CONFIG_COLOUR_H

/** @file
 *
 * Display colour configuration
 *
 */

FILE_LICENCE ( GPL2_OR_LATER_OR_UBDL );

#define COLOR_NORMAL_FG		COLOR_CYAN
#define COLOR_NORMAL_BG		COLOR_BLACK

#define COLOR_SELECT_FG		COLOR_WHITE
#define COLOR_SELECT_BG		COLOR_BLUE

#define COLOR_SEPARATOR_FG	COLOR_WHITE
#define COLOR_SEPARATOR_BG	COLOR_BLACK

#define COLOR_EDIT_FG		COLOR_BLACK
#define COLOR_EDIT_BG		COLOR_CYAN

#define COLOR_ALERT_FG		COLOR_WHITE
#define COLOR_ALERT_BG		COLOR_RED

#define COLOR_URL_FG		COLOR_CYAN
#define COLOR_URL_BG		COLOR_BLUE

#define COLOR_PXE_FG		COLOR_BLACK
#define COLOR_PXE_BG		COLOR_WHITE

#include <config/named.h>
#include NAMED_CONFIG(colour.h)
#include <config/local/colour.h>
#include LOCAL_NAMED_CONFIG(colour.h)

#endif /* CONFIG_COLOUR_H */
