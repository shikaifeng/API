# cmd: thrift --gen rb alipay.thrift

namespace java com.zhiping.taobao.thrift
namespace py AlipayThrift
namespace rb AlipayThrift


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

/** alipay mapi response data is invalide */
exception JSONParseException {
    1: required string why
}

#
# Interface definition for Taobao::Top Service
# 包含淘宝top的所有接口
#
service MapiServiceV1 {
    /**
     * 获取授权二维码
     * @param params. 以Hash数据格式需要传递的参数:
     * - target_id. 必选项, 要授权的设备id.
     * - target_logo_url. 可选项, 二维码中间的小图标.
     * 返回数据：
     * - string.
     */

    string getqrcode(1:map<string, string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te, 4:InvalideResponseDataException ide, 5:JSONParseException why),

    string getauthstate(1:map<string, string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te, 4:InvalideResponseDataException ide, 5:JSONParseException why),

    string pay(1:map<string, string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te, 4:InvalideResponseDataException ide, 5:JSONParseException why),

    string querypayresult(1:map<string, string> params)
    throws (1:InvalidRequestException ire, 2:UnavailableException ue, 3:TimedOutException te, 4:InvalideResponseDataException ide, 5:JSONParseException why),

}