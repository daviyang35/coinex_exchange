/*
 * Description: 
 *     History: yang@haipo.me, 2017/04/05, create
 */

# ifndef _UT_MYSQL_H_
# define _UT_MYSQL_H_

# include "ut_config.h"
# include <mysql.h>
# include <errmsg.h>

MYSQL *mysql_connect(mysql_cfg *cfg);
bool is_table_exists(MYSQL *conn, const char *table);

# endif

