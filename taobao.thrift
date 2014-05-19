# cmd: thrift -out taobao_thrift --gen rb taobao.thrift

namespace java com.zhiping.taobao.thrift
namespace py TaobaoThrift
namespace rb TaobaoThrift


# The API version (NOT the product version), composed as a dot delimited
# string with major, minor, and patch level components.
#
#  - Major: Incremented for backward incompatible changes. An example would
#           be changes to the number or disposition of method arguments.
#  - Minor: Incremented for backward compatible changes. An example would
#           be the addition of a new (optional) method.
#  - Patch: Incremented for bug fixes. The patch level should be increased
#           for every edit that doesn't result in a change to major/minor.
#
# See the Semantic Versioning Specification (SemVer) http://semver.org.
const string VERSION = "1.0.0"


#
# data structures
#




#
# Exceptions
# (note that internal server errors will raise a TApplicationException, courtesy of Thrift)
#

/** A specific column was requested that does not exist. */
exception NotFoundException {
}

/** Invalid request could mean keyspace or column family does not exist, required parameters are missing, or a parameter is malformed. 
    why contains an associated error message.
*/
exception InvalidRequestException {
    1: required string why
}

/** Not all the replicas required could be created and/or read. */
exception UnavailableException {
}

/** RPC timeout was exceeded.  either a node failed mid-operation, or load was too high, or the requested op was too large. */
exception TimedOutException {
}

/** invalid authentication request (invalid keyspace, user does not exist, or credentials invalid) */
exception AuthenticationException {
    1: required string why
}

/** invalid authorization request (user does not have access to keyspace) */
exception AuthorizationException {
    1: required string why
}

/** schemas are not in agreement across all nodes */
exception SchemaDisagreementException {
}

/** alipay mapi response data is invalide */
exception InvalideResponseDataException {
}



#
# Interface definition for Taobao::Top Service
# 包含淘宝top的所有接口
#
service TopServiceV1 {
    /**
     * 获取买家信息
     * @param params. 以Hash数据格式需要传递的参数:
     * - session. 必选项, 用户的top session.
     * - params. 可选项, 参数列表.
     * 返回数据：
     * - data. string(hash的字符串形式，需要执行JSON.parse).
     */
    string get_user_buyer(1:string session, 2:map<string, string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te),

    /**
     * 获取收货地址
     * @param params. 以Hash数据格式需要传递的参数:
     * - session. 必选项, 用户的top session.
     * - params. 可选项, 参数列表.
     * 返回数据：
     * - data. string(hash的字符串形式，需要执行JSON.parse).
     */
    string get_shipping_addresses(1:string session, 2:map<string, string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te),

    /**
     * 追加收货地址
     * @param params. 以Hash数据格式需要传递的参数:
     * - session. 必选项, 用户的top session.
     * - params. 必选项, 参数列表.
     * 返回数据：
     * - data. string(hash的字符串形式，需要执行JSON.parse).
     */
    string add_shipping_addresses(1:string session, 2:map<string, string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te),
    
    /**
     * 获取商品目录
     * @param params. 以Hash数据格式需要传递的参数:
     * - params. 必选项, 参数列表.
     * 返回数据：
     * - data. string(hash的字符串形式，需要执行JSON.parse).
     */
    string get_itemcats(1:map<string, string> opts)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te),

    /**
     * 获取商品的详细信息
     * @param params. 以Hash数据格式需要传递的参数:
     * - session. 必选项, 用户的top session.
     * - params. 必选项, 参数列表.
     * 返回数据：
     * - data. string(hash的字符串形式，需要执行JSON.parse).
     */
    string get_item_dealinfo(1:string session, 2:map<string, string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te),

    /**
     * 检索交易的物流信息
     * @param params. 以Hash数据格式需要传递的参数:
     * - session. 必选项, 用户的top session.
     * - params. 必选项, 参数列表.
     * 返回数据：
     * - data. string(hash的字符串形式，需要执行JSON.parse).
     */
    string search_logistics_trace(1:string session, 2:map<string, string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te),

    /**
     * 获取交易信息
     * @param params. 以Hash数据格式需要传递的参数:
     * - session. 必选项, 用户的top session.
     * - params. 必选项, 参数列表.
     * 返回数据：
     * - data. string(hash的字符串形式，需要执行JSON.parse).
     */
    string get_trade_bought(1:string session, 2:map<string, string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te),

    /**
     * 获取交易详情
     * @param params. 以Hash数据格式需要传递的参数:
     * - session. 必选项, 用户的top session.
     * - params. 必选项, 参数列表.
     * 返回数据：
     * - data. string(hash的字符串形式，需要执行JSON.parse).
     */
    string get_trade_fullinfo(1:string session, 2:map<string, string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te),

    /**
     * 创建淘宝订单
     * @param params. 以Hash数据格式需要传递的参数:
     * - session. 必选项, 用户的top session.
     * - params. 必选项, 参数列表.
     * 返回数据：
     * - data. string(hash的字符串形式，需要执行JSON.parse).
     */
    string create_trade(1:string session, 2:map<string, string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te),

    /**
     * 获取华数电视淘宝账号产生的交易信息
     * @param params. 以Hash数据格式需要传递的参数:
     * - session. 必选项, 用户的top session.
     * - params. 必选项, 参数列表.
     * 返回数据：
     * - data. string(hash的字符串形式，需要执行JSON.parse).
     */
    string get_trade_huashu_bought(1:string session, 2:map<string, string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te),

    /**
     * 获取华数电视淘宝账号产生的交易详情
     * @param params. 以Hash数据格式需要传递的参数:
     * - session. 必选项, 用户的top session.
     * - params. 必选项, 参数列表.
     * 返回数据：
     * - data. string(hash的字符串形式，需要执行JSON.parse).
     */
    string get_trade_huashu_fullinfo(1:string session, 2:map<string, string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te),

    /**
     * 追加同步消息
     * @param params. 以Hash数据格式需要传递的参数:
     * - session. 必选项, 用户的top session.
     * - params. 必选项, 参数列表.
     * 返回数据：
     * - data. string(hash的字符串形式，需要执行JSON.parse).
     */
    string add_sns_msg(1:string session, 2:map<string, string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te),

    /**
     * 获取促销增量
     * @param params. 以Hash数据格式需要传递的参数:
     * - session. 必选项, 用户的top session.
     * - params. 必选项, 参数列表.
     * 返回数据：
     * - data. string(hash的字符串形式，需要执行JSON.parse).
     */
    string get_ump_promotion_increment(1:string session, 2:map<string, string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te),

    /**
     * 获取聚划算详情
     * @param params. 以Hash数据格式需要传递的参数:
     * - session. 必选项, 用户的top session.
     * - params. 必选项, 参数列表.
     * 返回数据：
     * - data. string(hash的字符串形式，需要执行JSON.parse).
     */
    string get_ju_detail(1:string session, 2:map<string, string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te),

    /**
     * 参加聚划算
     * @param params. 以Hash数据格式需要传递的参数:
     * - session. 必选项, 用户的top session.
     * - params. 必选项, 参数列表.
     * 返回数据：
     * - data. string(hash的字符串形式，需要执行JSON.parse).
     */
    string join_ju_group(1:string session, 2:map<string, string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te),

    /**
     * 获取聚划算促销
     * @param params. 以Hash数据格式需要传递的参数:
     * - session. 必选项, 用户的top session.
     * - params. 必选项, 参数列表.
     * 返回数据：
     * - data. list
     */
    list<string> get_ju_promotion(1:list<string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te),

}

service ICService {

}