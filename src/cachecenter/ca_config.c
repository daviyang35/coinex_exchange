/*
 * Description: 
 *     History: zhoumugui@viabtc.com, 2019/01/22, create
 */

# include "ca_config.h"

struct settings settings;

static int read_config_from_json(json_t *root)
{
    int ret;
    ret = read_cfg_bool(root, "debug", &settings.debug, false, false);
    if (ret < 0) {
        printf("read debug config fail: %d\n", ret);
        return -__LINE__;
    }
    ret = load_cfg_process(root, "process", &settings.process);
    if (ret < 0) {
        printf("load process config fail: %d\n", ret);
        return -__LINE__;
    }
    ret = load_cfg_log(root, "log", &settings.log);
    if (ret < 0) {
        printf("load log config fail: %d\n", ret);
        return -__LINE__;
    }
    ret = load_cfg_alert(root, "alert", &settings.alert);
    if (ret < 0) {
        printf("load alert config fail: %d\n", ret);
        return -__LINE__;
    }

    ret = load_cfg_rpc_svr(root, "svr", &settings.svr);
    if (ret < 0) {
        printf("load svr config fail: %d\n", ret);
        return -__LINE__;
    }
    ret = load_cfg_rpc_svr(root, "deals_svr", &settings.deals_svr);
    if (ret < 0) {
        printf("load deals_svr config fail: %d\n", ret);
        return -__LINE__;
    }
    ret = load_cfg_rpc_svr(root, "state_svr", &settings.state_svr);
    if (ret < 0) {
        printf("load state_svr config fail: %d\n", ret);
        return -__LINE__;
    }
    ret = load_cfg_rpc_clt(root, "matchengine", &settings.matchengine);
    if (ret < 0) {
        printf("load matchengine clt config fail: %d\n", ret);
        return -__LINE__;
    }
    ret = load_cfg_rpc_clt(root, "marketprice", &settings.marketprice);
    if (ret < 0) {
        printf("load marketprice clt config fail: %d\n", ret);
        return -__LINE__;
    }
    ret = load_cfg_rpc_clt(root, "marketindex", &settings.marketindex);
    if (ret < 0) {
        printf("load marketindex clt config fail: %d\n", ret);
        return -__LINE__;
    }

    ERR_RET_LN(read_cfg_real(root, "deals_interval", &settings.deals_interval, false, 1.0));
    ERR_RET_LN(read_cfg_real(root, "status_interval", &settings.status_interval, false, 1.0));
    ERR_RET_LN(read_cfg_real(root, "depth_interval", &settings.depth_interval, false, 1.0));

    ERR_RET_LN(read_cfg_real(root, "backend_timeout", &settings.backend_timeout, false, 0.2));
    ERR_RET_LN(read_cfg_real(root, "market_interval", &settings.market_interval, false, 10));
    ERR_RET_LN(read_cfg_real(root, "index_interval", &settings.index_interval, false, 10));
    ERR_RET_LN(read_cfg_real(root, "depth_resend_timeout", &settings.depth_resend_timeout, false, 1.0));
    ERR_RET_LN(read_cfg_int(root, "depth_limit_max", &settings.depth_limit_max, false, 50));
    ERR_RET_LN(read_cfg_int(root, "deal_max", &settings.deal_max, false, 1000));
    ERR_RET_LN(read_cfg_int(root, "worker_num", &settings.worker_num, false, 2));
    ERR_RET_LN(read_cfg_int(root, "deal_max_request", &settings.deal_max_request, false, 20));

    return 0;
}

int init_config(const char *path)
{
    json_error_t error;
    json_t *root = json_load_file(path, 0, &error);
    if (root == NULL) {
        printf("json_load_file from: %s fail: %s in line: %d\n", path, error.text, error.line);
        return -__LINE__;
    }
    if (!json_is_object(root)) {
        json_decref(root);
        return -__LINE__;
    }
    int ret = read_config_from_json(root);
    if (ret < 0) {
        json_decref(root);
        return ret;
    }
    json_decref(root);

    return 0;
}

