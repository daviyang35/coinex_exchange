/*
 * Description: 
 *     History: yang@haipo.me, 2017/04/16, create
 */

# ifndef _MP_CONFIG_H_
# define _MP_CONFIG_H_

# include <math.h>
# include <stdio.h>
#if defined(__APPLE__)
#include <mach/error.h>
#else
# include <error.h>
#endif
# include <errno.h>
# include <ctype.h>
# include <string.h>
# include <stdlib.h>
# include <unistd.h>
# include <assert.h>
# include <inttypes.h>

# include "nw_svr.h"
# include "nw_clt.h"
# include "nw_job.h"
# include "nw_state.h"
# include "nw_timer.h"

# include "ut_log.h"
# include "ut_sds.h"
# include "ut_cli.h"
# include "ut_misc.h"
# include "ut_list.h"
# include "ut_kafka.h"
# include "ut_title.h"
# include "ut_signal.h"
# include "ut_config.h"
# include "ut_define.h"
# include "ut_profile.h"
# include "ut_decimal.h"
# include "ut_rpc_clt.h"
# include "ut_rpc_svr.h"
# include "ut_rpc_cmd.h"
# include "ut_comm_dict.h"
# include "ut_json_rpc.h"

struct settings {
    bool                debug;
    process_cfg         process;
    log_cfg             log;
    alert_cfg           alert;
    rpc_svr_cfg         svr;
    redis_cfg           redis;
    mysql_cfg           db_log;
    char                *brokers;

    int                 sec_max;
    int                 min_max;
    int                 hour_max;
    int                 kline_max;
    int                 worker_num;
    int                 deal_summary_max;
    int                 pipeline_len_max;
    double              cache_timeout;
    double              worker_timeout;
    char                *accesshttp;
};

extern struct settings settings;
int init_config(const char *path);

# endif
