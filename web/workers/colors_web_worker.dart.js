(function dartProgram(){function copyProperties(a,b){var s=Object.keys(a)
for(var r=0;r<s.length;r++){var q=s[r]
b[q]=a[q]}}function mixinPropertiesHard(a,b){var s=Object.keys(a)
for(var r=0;r<s.length;r++){var q=s[r]
if(!b.hasOwnProperty(q))b[q]=a[q]}}function mixinPropertiesEasy(a,b){Object.assign(b,a)}var z=function(){var s=function(){}
s.prototype={p:{}}
var r=new s()
if(!(r.__proto__&&r.__proto__.p===s.prototype.p))return false
try{if(typeof navigator!="undefined"&&typeof navigator.userAgent=="string"&&navigator.userAgent.indexOf("Chrome/")>=0)return true
if(typeof version=="function"&&version.length==0){var q=version()
if(/^\d+\.\d+\.\d+\.\d+$/.test(q))return true}}catch(p){}return false}()
function inherit(a,b){a.prototype.constructor=a
a.prototype["$i"+a.name]=a
if(b!=null){if(z){a.prototype.__proto__=b.prototype
return}var s=Object.create(b.prototype)
copyProperties(a.prototype,s)
a.prototype=s}}function inheritMany(a,b){for(var s=0;s<b.length;s++)inherit(b[s],a)}function mixinEasy(a,b){mixinPropertiesEasy(b.prototype,a.prototype)
a.prototype.constructor=a}function mixinHard(a,b){mixinPropertiesHard(b.prototype,a.prototype)
a.prototype.constructor=a}function lazyOld(a,b,c,d){var s=a
a[b]=s
a[c]=function(){a[c]=function(){A.p8(b)}
var r
var q=d
try{if(a[b]===s){r=a[b]=q
r=a[b]=d()}else r=a[b]}finally{if(r===q)a[b]=null
a[c]=function(){return this[b]}}return r}}function lazy(a,b,c,d){var s=a
a[b]=s
a[c]=function(){if(a[b]===s)a[b]=d()
a[c]=function(){return this[b]}
return a[b]}}function lazyFinal(a,b,c,d){var s=a
a[b]=s
a[c]=function(){if(a[b]===s){var r=d()
if(a[b]!==s)A.lr(b)
a[b]=r}var q=a[b]
a[c]=function(){return q}
return q}}function makeConstList(a){a.immutable$list=Array
a.fixed$length=Array
return a}function convertToFastObject(a){function t(){}t.prototype=a
new t()
return a}function convertAllToFastObject(a){for(var s=0;s<a.length;++s)convertToFastObject(a[s])}var y=0
function instanceTearOffGetter(a,b){var s=null
return a?function(c){if(s===null)s=A.jE(b)
return new s(c,this)}:function(){if(s===null)s=A.jE(b)
return new s(this,null)}}function staticTearOffGetter(a){var s=null
return function(){if(s===null)s=A.jE(a).prototype
return s}}var x=0
function tearOffParameters(a,b,c,d,e,f,g,h,i,j){if(typeof h=="number")h+=x
return{co:a,iS:b,iI:c,rC:d,dV:e,cs:f,fs:g,fT:h,aI:i||0,nDA:j}}function installStaticTearOff(a,b,c,d,e,f,g,h){var s=tearOffParameters(a,true,false,c,d,e,f,g,h,false)
var r=staticTearOffGetter(s)
a[b]=r}function installInstanceTearOff(a,b,c,d,e,f,g,h,i,j){c=!!c
var s=tearOffParameters(a,false,c,d,e,f,g,h,i,!!j)
var r=instanceTearOffGetter(c,s)
a[b]=r}function setOrUpdateInterceptorsByTag(a){var s=v.interceptorsByTag
if(!s){v.interceptorsByTag=a
return}copyProperties(a,s)}function setOrUpdateLeafTags(a){var s=v.leafTags
if(!s){v.leafTags=a
return}copyProperties(a,s)}function updateTypes(a){var s=v.types
var r=s.length
s.push.apply(s,a)
return r}function updateHolder(a,b){copyProperties(b,a)
return a}var hunkHelpers=function(){var s=function(a,b,c,d,e){return function(f,g,h,i){return installInstanceTearOff(f,g,a,b,c,d,[h],i,e,false)}},r=function(a,b,c,d){return function(e,f,g,h){return installStaticTearOff(e,f,a,b,c,[g],h,d)}}
return{inherit:inherit,inheritMany:inheritMany,mixin:mixinEasy,mixinHard:mixinHard,installStaticTearOff:installStaticTearOff,installInstanceTearOff:installInstanceTearOff,_instance_0u:s(0,0,null,["$0"],0),_instance_1u:s(0,1,null,["$1"],0),_instance_2u:s(0,2,null,["$2"],0),_instance_0i:s(1,0,null,["$0"],0),_instance_1i:s(1,1,null,["$1"],0),_instance_2i:s(1,2,null,["$2"],0),_static_0:r(0,null,["$0"],0),_static_1:r(1,null,["$1"],0),_static_2:r(2,null,["$2"],0),makeConstList:makeConstList,lazy:lazy,lazyFinal:lazyFinal,lazyOld:lazyOld,updateHolder:updateHolder,convertToFastObject:convertToFastObject,updateTypes:updateTypes,setOrUpdateInterceptorsByTag:setOrUpdateInterceptorsByTag,setOrUpdateLeafTags:setOrUpdateLeafTags}}()
function initializeDeferredHunk(a){x=v.types.length
a(hunkHelpers,v,w,$)}var A={j1:function j1(){},
mt(a){return new A.bn("Field '"+a+"' has been assigned during initialization.")},
ki(a){return new A.bn("Field '"+a+"' has not been initialized.")},
c3(a,b,c){return a},
jf(a,b,c,d){A.en(b,"start")
if(c!=null){A.en(c,"end")
if(b>c)A.D(A.O(b,0,c,"start",null))}return new A.cJ(a,b,c,d.l("cJ<0>"))},
km(a,b,c,d){if(t.gw.b(a))return new A.bh(a,b,c.l("@<0>").D(d).l("bh<1,2>"))
return new A.aF(a,b,c.l("@<0>").D(d).l("aF<1,2>"))},
bk(){return new A.bR("No element")},
k9(){return new A.bR("Too few elements")},
mM(a,b,c){A.ep(a,0,J.aS(a)-1,b,c)},
ep(a,b,c,d,e){if(c-b<=32)A.mL(a,b,c,d,e)
else A.mK(a,b,c,d,e)},
mL(a,b,c,d,e){var s,r,q,p,o,n
for(s=b+1,r=J.J(a);s<=c;++s){q=r.m(a,s)
p=s
while(!0){if(p>b){o=d.$2(r.m(a,p-1),q)
if(typeof o!=="number")return o.ae()
o=o>0}else o=!1
if(!o)break
n=p-1
r.h(a,p,r.m(a,n))
p=n}r.h(a,p,q)}},
mK(a3,a4,a5,a6,a7){var s,r,q,p,o,n,m,l,k,j=B.a.F(a5-a4+1,6),i=a4+j,h=a5-j,g=B.a.F(a4+a5,2),f=g-j,e=g+j,d=J.J(a3),c=d.m(a3,i),b=d.m(a3,f),a=d.m(a3,g),a0=d.m(a3,e),a1=d.m(a3,h),a2=a6.$2(c,b)
if(typeof a2!=="number")return a2.ae()
if(a2>0){s=b
b=c
c=s}a2=a6.$2(a0,a1)
if(typeof a2!=="number")return a2.ae()
if(a2>0){s=a1
a1=a0
a0=s}a2=a6.$2(c,a)
if(typeof a2!=="number")return a2.ae()
if(a2>0){s=a
a=c
c=s}a2=a6.$2(b,a)
if(typeof a2!=="number")return a2.ae()
if(a2>0){s=a
a=b
b=s}a2=a6.$2(c,a0)
if(typeof a2!=="number")return a2.ae()
if(a2>0){s=a0
a0=c
c=s}a2=a6.$2(a,a0)
if(typeof a2!=="number")return a2.ae()
if(a2>0){s=a0
a0=a
a=s}a2=a6.$2(b,a1)
if(typeof a2!=="number")return a2.ae()
if(a2>0){s=a1
a1=b
b=s}a2=a6.$2(b,a)
if(typeof a2!=="number")return a2.ae()
if(a2>0){s=a
a=b
b=s}a2=a6.$2(a0,a1)
if(typeof a2!=="number")return a2.ae()
if(a2>0){s=a1
a1=a0
a0=s}d.h(a3,i,c)
d.h(a3,g,a)
d.h(a3,h,a1)
d.h(a3,f,d.m(a3,a4))
d.h(a3,e,d.m(a3,a5))
r=a4+1
q=a5-1
if(J.aj(a6.$2(b,a0),0)){for(p=r;p<=q;++p){o=d.m(a3,p)
n=a6.$2(o,b)
if(n===0)continue
if(n<0){if(p!==r){d.h(a3,p,d.m(a3,r))
d.h(a3,r,o)}++r}else for(;!0;){n=a6.$2(d.m(a3,q),b)
if(n>0){--q
continue}else{m=q-1
if(n<0){d.h(a3,p,d.m(a3,r))
l=r+1
d.h(a3,r,d.m(a3,q))
d.h(a3,q,o)
q=m
r=l
break}else{d.h(a3,p,d.m(a3,q))
d.h(a3,q,o)
q=m
break}}}}k=!0}else{for(p=r;p<=q;++p){o=d.m(a3,p)
if(a6.$2(o,b)<0){if(p!==r){d.h(a3,p,d.m(a3,r))
d.h(a3,r,o)}++r}else if(a6.$2(o,a0)>0)for(;!0;)if(a6.$2(d.m(a3,q),a0)>0){--q
if(q<p)break
continue}else{m=q-1
if(a6.$2(d.m(a3,q),b)<0){d.h(a3,p,d.m(a3,r))
l=r+1
d.h(a3,r,d.m(a3,q))
d.h(a3,q,o)
r=l}else{d.h(a3,p,d.m(a3,q))
d.h(a3,q,o)}q=m
break}}k=!1}a2=r-1
d.h(a3,a4,d.m(a3,a2))
d.h(a3,a2,b)
a2=q+1
d.h(a3,a5,d.m(a3,a2))
d.h(a3,a2,a0)
A.ep(a3,a4,r-2,a6,a7)
A.ep(a3,q+2,a5,a6,a7)
if(k)return
if(r<i&&q>h){for(;J.aj(a6.$2(d.m(a3,r),b),0);)++r
for(;J.aj(a6.$2(d.m(a3,q),a0),0);)--q
for(p=r;p<=q;++p){o=d.m(a3,p)
if(a6.$2(o,b)===0){if(p!==r){d.h(a3,p,d.m(a3,r))
d.h(a3,r,o)}++r}else if(a6.$2(o,a0)===0)for(;!0;)if(a6.$2(d.m(a3,q),a0)===0){--q
if(q<p)break
continue}else{m=q-1
if(a6.$2(d.m(a3,q),b)<0){d.h(a3,p,d.m(a3,r))
l=r+1
d.h(a3,r,d.m(a3,q))
d.h(a3,q,o)
r=l}else{d.h(a3,p,d.m(a3,q))
d.h(a3,q,o)}q=m
break}}A.ep(a3,r,q,a6,a7)}else A.ep(a3,r,q,a6,a7)},
bn:function bn(a){this.a=a},
be:function be(a){this.a=a},
iN:function iN(){},
p:function p(){},
T:function T(){},
cJ:function cJ(a,b,c,d){var _=this
_.a=a
_.b=b
_.c=c
_.$ti=d},
bp:function bp(a,b,c){var _=this
_.a=a
_.b=b
_.c=0
_.d=null
_.$ti=c},
aF:function aF(a,b,c){this.a=a
this.b=b
this.$ti=c},
bh:function bh(a,b,c){this.a=a
this.b=b
this.$ti=c},
cx:function cx(a,b,c){var _=this
_.a=null
_.b=a
_.c=b
_.$ti=c},
aG:function aG(a,b,c){this.a=a
this.b=b
this.$ti=c},
S:function S(a,b,c){this.a=a
this.b=b
this.$ti=c},
cS:function cS(a,b,c){this.a=a
this.b=b
this.$ti=c},
cf:function cf(a,b,c){this.a=a
this.b=b
this.$ti=c},
cg:function cg(a,b,c,d){var _=this
_.a=a
_.b=b
_.c=c
_.d=null
_.$ti=d},
bi:function bi(a){this.$ti=a},
cb:function cb(a){this.$ti=a},
X:function X(){},
bt:function bt(){},
bU:function bU(){},
mi(a){if(typeof a=="number")return B.c.ga3(a)
if(t.bA.b(a))return A.cD(a)
return A.lm(a)},
mj(a){return new A.fh(a)},
ls(a){var s=v.mangledGlobalNames[a]
if(s!=null)return s
return"minified:"+a},
p_(a,b){var s
if(b!=null){s=b.x
if(s!=null)return s}return t.ez.b(a)},
r(a){var s
if(typeof a=="string")return a
if(typeof a=="number"){if(a!==0)return""+a}else if(!0===a)return"true"
else if(!1===a)return"false"
else if(a==null)return"null"
s=J.bD(a)
return s},
cD(a){var s,r=$.kq
if(r==null)r=$.kq=Symbol("identityHashCode")
s=a[r]
if(s==null){s=Math.random()*0x3fffffff|0
a[r]=s}return s},
mD(a,b){var s,r=/^\s*[+-]?((0x[a-f0-9]+)|(\d+)|([a-z0-9]+))\s*$/i.exec(a)
if(r==null)return null
if(3>=r.length)return A.a(r,3)
s=r[3]
if(s!=null)return parseInt(a,10)
if(r[2]!=null)return parseInt(a,16)
return null},
fN(a){return A.mC(a)},
mC(a){var s,r,q,p
if(a instanceof A.q)return A.ai(A.a5(a),null)
s=J.c5(a)
if(s===B.aE||s===B.aG||t.bI.b(a)){r=B.Q(a)
if(r!=="Object"&&r!=="")return r
q=a.constructor
if(typeof q=="function"){p=q.name
if(typeof p=="string"&&p!=="Object"&&p!=="")return p}}return A.ai(A.a5(a),null)},
kp(a){var s,r,q,p,o=a.length
if(o<=500)return String.fromCharCode.apply(null,a)
for(s="",r=0;r<o;r=q){q=r+500
p=q<o?q:o
s+=String.fromCharCode.apply(null,a.slice(r,p))}return s},
mE(a){var s,r,q,p=A.b([],t.t)
for(s=a.length,r=0;r<a.length;a.length===s||(0,A.di)(a),++r){q=a[r]
if(!A.iu(q))throw A.d(A.b8(q))
if(q<=65535)B.b.v(p,q)
else if(q<=1114111){B.b.v(p,55296+(B.a.i(q-65536,10)&1023))
B.b.v(p,56320+(q&1023))}else throw A.d(A.b8(q))}return A.kp(p)},
kx(a){var s,r,q
for(s=a.length,r=0;r<s;++r){q=a[r]
if(!A.iu(q))throw A.d(A.b8(q))
if(q<0)throw A.d(A.b8(q))
if(q>65535)return A.mE(a)}return A.kp(a)},
mF(a,b,c){var s,r,q,p
if(c<=500&&b===0&&c===a.length)return String.fromCharCode.apply(null,a)
for(s=b,r="";s<c;s=q){q=s+500
p=q<c?q:c
r+=String.fromCharCode.apply(null,a.subarray(s,p))}return r},
C(a){var s
if(a<=65535)return String.fromCharCode(a)
if(a<=1114111){s=a-65536
return String.fromCharCode((B.a.i(s,10)|55296)>>>0,s&1023|56320)}throw A.d(A.O(a,0,1114111,null,null))},
ad(a){if(a.date===void 0)a.date=new Date(a.a)
return a.date},
ee(a){return a.b?A.ad(a).getUTCFullYear()+0:A.ad(a).getFullYear()+0},
kv(a){return a.b?A.ad(a).getUTCMonth()+1:A.ad(a).getMonth()+1},
kr(a){return a.b?A.ad(a).getUTCDate()+0:A.ad(a).getDate()+0},
ks(a){return a.b?A.ad(a).getUTCHours()+0:A.ad(a).getHours()+0},
ku(a){return a.b?A.ad(a).getUTCMinutes()+0:A.ad(a).getMinutes()+0},
kw(a){return a.b?A.ad(a).getUTCSeconds()+0:A.ad(a).getSeconds()+0},
kt(a){return a.b?A.ad(a).getUTCMilliseconds()+0:A.ad(a).getMilliseconds()+0},
P(a){throw A.d(A.b8(a))},
a(a,b){if(a==null)J.aS(a)
throw A.d(A.c4(a,b))},
c4(a,b){var s,r="index",q=null
if(!A.iu(b))return new A.at(!0,b,r,q)
s=A.n(J.aS(a))
if(b<0||b>=s)return A.fr(b,a,r,q,s)
return new A.bQ(q,q,!0,b,r,"Value not in range")},
oM(a,b,c){if(a<0||a>c)return A.O(a,0,c,"start",null)
if(b!=null)if(b<a||b>c)return A.O(b,a,c,"end",null)
return new A.at(!0,b,"end",null)},
b8(a){return new A.at(!0,a,null,null)},
lf(a){return a},
oI(a){return a},
d(a){var s,r
if(a==null)a=new A.e9()
s=new Error()
s.dartException=a
r=A.p9
if("defineProperty" in Object){Object.defineProperty(s,"message",{get:r})
s.name=""}else s.toString=r
return s},
p9(){return J.bD(this.dartException)},
D(a){throw A.d(a)},
di(a){throw A.d(A.ay(a))},
aI(a){var s,r,q,p,o,n
a=A.p6(a.replace(String({}),"$receiver$"))
s=a.match(/\\\$[a-zA-Z]+\\\$/g)
if(s==null)s=A.b([],t.s)
r=s.indexOf("\\$arguments\\$")
q=s.indexOf("\\$argumentsExpr\\$")
p=s.indexOf("\\$expr\\$")
o=s.indexOf("\\$method\\$")
n=s.indexOf("\\$receiver\\$")
return new A.he(a.replace(new RegExp("\\\\\\$arguments\\\\\\$","g"),"((?:x|[^x])*)").replace(new RegExp("\\\\\\$argumentsExpr\\\\\\$","g"),"((?:x|[^x])*)").replace(new RegExp("\\\\\\$expr\\\\\\$","g"),"((?:x|[^x])*)").replace(new RegExp("\\\\\\$method\\\\\\$","g"),"((?:x|[^x])*)").replace(new RegExp("\\\\\\$receiver\\\\\\$","g"),"((?:x|[^x])*)"),r,q,p,o,n)},
hf(a){return function($expr$){var $argumentsExpr$="$arguments$"
try{$expr$.$method$($argumentsExpr$)}catch(s){return s.message}}(a)},
kI(a){return function($expr$){try{$expr$.$method$}catch(s){return s.message}}(a)},
j2(a,b){var s=b==null,r=s?null:b.method
return new A.dX(a,r,s?null:b.receiver)},
a1(a){var s
if(a==null)return new A.fG(a)
if(a instanceof A.cd){s=a.a
return A.ba(a,s==null?t.K.a(s):s)}if(typeof a!=="object")return a
if("dartException" in a)return A.ba(a,a.dartException)
return A.oB(a)},
ba(a,b){if(t.Q.b(b))if(b.$thrownJsError==null)b.$thrownJsError=a
return b},
oB(a){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e=null
if(!("message" in a))return a
s=a.message
if("number" in a&&typeof a.number=="number"){r=a.number
q=r&65535
if((B.a.i(r,16)&8191)===10)switch(q){case 438:return A.ba(a,A.j2(A.r(s)+" (Error "+q+")",e))
case 445:case 5007:p=A.r(s)
return A.ba(a,new A.cB(p+" (Error "+q+")",e))}}if(a instanceof TypeError){o=$.lw()
n=$.lx()
m=$.ly()
l=$.lz()
k=$.lC()
j=$.lD()
i=$.lB()
$.lA()
h=$.lF()
g=$.lE()
f=o.aj(s)
if(f!=null)return A.ba(a,A.j2(A.aN(s),f))
else{f=n.aj(s)
if(f!=null){f.method="call"
return A.ba(a,A.j2(A.aN(s),f))}else{f=m.aj(s)
if(f==null){f=l.aj(s)
if(f==null){f=k.aj(s)
if(f==null){f=j.aj(s)
if(f==null){f=i.aj(s)
if(f==null){f=l.aj(s)
if(f==null){f=h.aj(s)
if(f==null){f=g.aj(s)
p=f!=null}else p=!0}else p=!0}else p=!0}else p=!0}else p=!0}else p=!0}else p=!0
if(p){A.aN(s)
return A.ba(a,new A.cB(s,f==null?e:f.method))}}}return A.ba(a,new A.eB(typeof s=="string"?s:""))}if(a instanceof RangeError){if(typeof s=="string"&&s.indexOf("call stack")!==-1)return new A.cI()
s=function(b){try{return String(b)}catch(d){}return null}(a)
return A.ba(a,new A.at(!1,e,e,typeof s=="string"?s.replace(/^RangeError:\s*/,""):s))}if(typeof InternalError=="function"&&a instanceof InternalError)if(typeof s=="string"&&s==="too much recursion")return new A.cI()
return a},
af(a){var s
if(a instanceof A.cd)return a.b
if(a==null)return new A.d5(a)
s=a.$cachedTrace
if(s!=null)return s
return a.$cachedTrace=new A.d5(a)},
lm(a){if(a==null||typeof a!="object")return J.dk(a)
else return A.cD(a)},
li(a,b){var s,r,q,p=a.length
for(s=0;s<p;s=q){r=s+1
q=r+1
b.h(0,a[s],a[r])}return b},
oZ(a,b,c,d,e,f){t.Y.a(a)
switch(A.n(b)){case 0:return a.$0()
case 1:return a.$1(c)
case 2:return a.$2(c,d)
case 3:return a.$3(c,d,e)
case 4:return a.$4(c,d,e,f)}throw A.d(new A.hU("Unsupported number of arguments for wrapped closure"))},
bB(a,b){var s
if(a==null)return null
s=a.$identity
if(!!s)return s
s=function(c,d,e){return function(f,g,h,i){return e(c,d,f,g,h,i)}}(a,b,A.oZ)
a.$identity=s
return s},
m3(a2){var s,r,q,p,o,n,m,l,k,j,i=a2.co,h=a2.iS,g=a2.iI,f=a2.nDA,e=a2.aI,d=a2.fs,c=a2.cs,b=d[0],a=c[0],a0=i[b],a1=a2.fT
a1.toString
s=h?Object.create(new A.er().constructor.prototype):Object.create(new A.bF(null,null).constructor.prototype)
s.$initialize=s.constructor
if(h)r=function static_tear_off(){this.$initialize()}
else r=function tear_off(a3,a4){this.$initialize(a3,a4)}
s.constructor=r
r.prototype=s
s.$_name=b
s.$_target=a0
q=!h
if(q)p=A.jZ(b,a0,g,f)
else{s.$static_name=b
p=a0}s.$S=A.m_(a1,h,g)
s[a]=p
for(o=p,n=1;n<d.length;++n){m=d[n]
if(typeof m=="string"){l=i[m]
k=m
m=l}else k=""
j=c[n]
if(j!=null){if(q)m=A.jZ(k,m,g,f)
s[j]=m}if(n===e)o=m}s.$C=o
s.$R=a2.rC
s.$D=a2.dV
return r},
m_(a,b,c){if(typeof a=="number")return a
if(typeof a=="string"){if(b)throw A.d("Cannot compute signature for static tearoff.")
return function(d,e){return function(){return e(this,d)}}(a,A.lW)}throw A.d("Error in functionType of tearoff")},
m0(a,b,c,d){var s=A.jY
switch(b?-1:a){case 0:return function(e,f){return function(){return f(this)[e]()}}(c,s)
case 1:return function(e,f){return function(g){return f(this)[e](g)}}(c,s)
case 2:return function(e,f){return function(g,h){return f(this)[e](g,h)}}(c,s)
case 3:return function(e,f){return function(g,h,i){return f(this)[e](g,h,i)}}(c,s)
case 4:return function(e,f){return function(g,h,i,j){return f(this)[e](g,h,i,j)}}(c,s)
case 5:return function(e,f){return function(g,h,i,j,k){return f(this)[e](g,h,i,j,k)}}(c,s)
default:return function(e,f){return function(){return e.apply(f(this),arguments)}}(d,s)}},
jZ(a,b,c,d){var s,r
if(c)return A.m2(a,b,d)
s=b.length
r=A.m0(s,d,a,b)
return r},
m1(a,b,c,d){var s=A.jY,r=A.lX
switch(b?-1:a){case 0:throw A.d(new A.eo("Intercepted function with no arguments."))
case 1:return function(e,f,g){return function(){return f(this)[e](g(this))}}(c,r,s)
case 2:return function(e,f,g){return function(h){return f(this)[e](g(this),h)}}(c,r,s)
case 3:return function(e,f,g){return function(h,i){return f(this)[e](g(this),h,i)}}(c,r,s)
case 4:return function(e,f,g){return function(h,i,j){return f(this)[e](g(this),h,i,j)}}(c,r,s)
case 5:return function(e,f,g){return function(h,i,j,k){return f(this)[e](g(this),h,i,j,k)}}(c,r,s)
case 6:return function(e,f,g){return function(h,i,j,k,l){return f(this)[e](g(this),h,i,j,k,l)}}(c,r,s)
default:return function(e,f,g){return function(){var q=[g(this)]
Array.prototype.push.apply(q,arguments)
return e.apply(f(this),q)}}(d,r,s)}},
m2(a,b,c){var s,r
if($.jW==null)$.jW=A.jV("interceptor")
if($.jX==null)$.jX=A.jV("receiver")
s=b.length
r=A.m1(s,c,a,b)
return r},
jE(a){return A.m3(a)},
lW(a,b){return A.io(v.typeUniverse,A.a5(a.a),b)},
jY(a){return a.a},
lX(a){return a.b},
jV(a){var s,r,q,p=new A.bF("receiver","interceptor"),o=J.kd(Object.getOwnPropertyNames(p),t.X)
for(s=o.length,r=0;r<s;++r){q=o[r]
if(p[q]===a)return q}throw A.d(A.bE("Field name "+a+" not found.",null))},
aP(a){if(a==null)A.oD("boolean expression must not be null")
return a},
oD(a){throw A.d(new A.eI(a))},
p8(a){throw A.d(new A.dt(a))},
oS(a){return v.getIsolateTag(a)},
fB(a,b,c){var s=new A.bo(a,b,c.l("bo<0>"))
s.c=a.e
return s},
qE(a,b,c){Object.defineProperty(a,b,{value:c,enumerable:false,writable:true,configurable:true})},
p1(a){var s,r,q,p,o,n=A.aN($.lk.$1(a)),m=$.iD[n]
if(m!=null){Object.defineProperty(a,v.dispatchPropertyName,{value:m,enumerable:false,writable:true,configurable:true})
return m.i}s=$.iK[n]
if(s!=null)return s
r=v.interceptorsByTag[n]
if(r==null){q=A.jt($.ld.$2(a,n))
if(q!=null){m=$.iD[q]
if(m!=null){Object.defineProperty(a,v.dispatchPropertyName,{value:m,enumerable:false,writable:true,configurable:true})
return m.i}s=$.iK[q]
if(s!=null)return s
r=v.interceptorsByTag[q]
n=q}}if(r==null)return null
s=r.prototype
p=n[0]
if(p==="!"){m=A.iM(s)
$.iD[n]=m
Object.defineProperty(a,v.dispatchPropertyName,{value:m,enumerable:false,writable:true,configurable:true})
return m.i}if(p==="~"){$.iK[n]=s
return s}if(p==="-"){o=A.iM(s)
Object.defineProperty(Object.getPrototypeOf(a),v.dispatchPropertyName,{value:o,enumerable:false,writable:true,configurable:true})
return o.i}if(p==="+")return A.ln(a,s)
if(p==="*")throw A.d(A.eA(n))
if(v.leafTags[n]===true){o=A.iM(s)
Object.defineProperty(Object.getPrototypeOf(a),v.dispatchPropertyName,{value:o,enumerable:false,writable:true,configurable:true})
return o.i}else return A.ln(a,s)},
ln(a,b){var s=Object.getPrototypeOf(a)
Object.defineProperty(s,v.dispatchPropertyName,{value:J.jG(b,s,null,null),enumerable:false,writable:true,configurable:true})
return b},
iM(a){return J.jG(a,!1,null,!!a.$iaa)},
p3(a,b,c){var s=b.prototype
if(v.leafTags[a]===true)return A.iM(s)
else return J.jG(s,c,null,null)},
oW(){if(!0===$.jF)return
$.jF=!0
A.oX()},
oX(){var s,r,q,p,o,n,m,l
$.iD=Object.create(null)
$.iK=Object.create(null)
A.oV()
s=v.interceptorsByTag
r=Object.getOwnPropertyNames(s)
if(typeof window!="undefined"){window
q=function(){}
for(p=0;p<r.length;++p){o=r[p]
n=$.lp.$1(o)
if(n!=null){m=A.p3(o,s[o],n)
if(m!=null){Object.defineProperty(n,v.dispatchPropertyName,{value:m,enumerable:false,writable:true,configurable:true})
q.prototype=n}}}}for(p=0;p<r.length;++p){o=r[p]
if(/^[A-Za-z_]/.test(o)){l=s[o]
s["!"+o]=l
s["~"+o]=l
s["-"+o]=l
s["+"+o]=l
s["*"+o]=l}}},
oV(){var s,r,q,p,o,n,m=B.ap()
m=A.c2(B.aq,A.c2(B.ar,A.c2(B.R,A.c2(B.R,A.c2(B.as,A.c2(B.at,A.c2(B.au(B.Q),m)))))))
if(typeof dartNativeDispatchHooksTransformer!="undefined"){s=dartNativeDispatchHooksTransformer
if(typeof s=="function")s=[s]
if(s.constructor==Array)for(r=0;r<s.length;++r){q=s[r]
if(typeof q=="function")m=q(m)||m}}p=m.getTag
o=m.getUnknownTag
n=m.prototypeForTag
$.lk=new A.iH(p)
$.ld=new A.iI(o)
$.lp=new A.iJ(n)},
c2(a,b){return a(b)||b},
p6(a){if(/[[\]{}()*+?.\\^$|]/.test(a))return a.replace(/[[\]{}()*+?.\\^$|]/g,"\\$&")
return a},
ca:function ca(){},
cj:function cj(a,b){this.a=a
this.$ti=b},
fh:function fh(a){this.a=a},
he:function he(a,b,c,d,e,f){var _=this
_.a=a
_.b=b
_.c=c
_.d=d
_.e=e
_.f=f},
cB:function cB(a,b){this.a=a
this.b=b},
dX:function dX(a,b,c){this.a=a
this.b=b
this.c=c},
eB:function eB(a){this.a=a},
fG:function fG(a){this.a=a},
cd:function cd(a,b){this.a=a
this.b=b},
d5:function d5(a){this.a=a
this.b=null},
bd:function bd(){},
dp:function dp(){},
dq:function dq(){},
ev:function ev(){},
er:function er(){},
bF:function bF(a,b){this.a=a
this.b=b},
eo:function eo(a){this.a=a},
eI:function eI(a){this.a=a},
ah:function ah(a){var _=this
_.a=0
_.f=_.e=_.d=_.c=_.b=null
_.r=0
_.$ti=a},
fz:function fz(a){this.a=a},
fy:function fy(a){this.a=a},
fA:function fA(a,b){var _=this
_.a=a
_.b=b
_.d=_.c=null},
an:function an(a,b){this.a=a
this.$ti=b},
bo:function bo(a,b,c){var _=this
_.a=a
_.b=b
_.d=_.c=null
_.$ti=c},
iH:function iH(a){this.a=a},
iI:function iI(a){this.a=a},
iJ:function iJ(a){this.a=a},
c(a){return A.D(A.ki(a))},
lr(a){return A.D(A.mt(a))},
ar(a){var s=new A.hP(a)
return s.b=s},
hP:function hP(a){this.a=a
this.b=null},
bz(a,b,c){},
ob(a){return a},
mx(a){return new Float32Array(a)},
my(a,b,c){A.bz(a,b,c)
c=B.a.F(a.byteLength-b,4)
return new Float32Array(a,b,c)},
mz(a){return new Int32Array(a)},
kn(a){return new Int8Array(a)},
mA(a){return new Uint16Array(a)},
mB(a){return new Uint32Array(a)},
j6(a,b,c){A.bz(a,b,c)
c=B.a.F(a.byteLength-b,4)
return new Uint32Array(a,b,c)},
fE(a){return new Uint8Array(a)},
N(a,b,c){A.bz(a,b,c)
return c==null?new Uint8Array(a,b):new Uint8Array(a,b,c)},
aO(a,b,c){if(a>>>0!==a||a>=c)throw A.d(A.c4(b,a))},
av(a,b,c){var s
if(!(a>>>0!==a))if(b==null)s=a>c
else s=b>>>0!==b||a>b||b>c
else s=!0
if(s)throw A.d(A.oM(a,b,c))
if(b==null)return c
return b},
cy:function cy(){},
K:function K(){},
Q:function Q(){},
aX:function aX(){},
ac:function ac(){},
e3:function e3(){},
e4:function e4(){},
e5:function e5(){},
e6:function e6(){},
e7:function e7(){},
e8:function e8(){},
cz:function cz(){},
cA:function cA(){},
bq:function bq(){},
d_:function d_(){},
d0:function d0(){},
d1:function d1(){},
d2:function d2(){},
kB(a,b){var s=b.c
return s==null?b.c=A.jq(a,b.y,!0):s},
kA(a,b){var s=b.c
return s==null?b.c=A.d8(a,"a8",[b.y]):s},
kC(a){var s=a.x
if(s===6||s===7||s===8)return A.kC(a.y)
return s===11||s===12},
mJ(a){return a.at},
dg(a){return A.jr(v.typeUniverse,a,!1)},
b7(a,b,a0,a1){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c=b.x
switch(c){case 5:case 1:case 2:case 3:case 4:return b
case 6:s=b.y
r=A.b7(a,s,a0,a1)
if(r===s)return b
return A.l1(a,r,!0)
case 7:s=b.y
r=A.b7(a,s,a0,a1)
if(r===s)return b
return A.jq(a,r,!0)
case 8:s=b.y
r=A.b7(a,s,a0,a1)
if(r===s)return b
return A.l0(a,r,!0)
case 9:q=b.z
p=A.df(a,q,a0,a1)
if(p===q)return b
return A.d8(a,b.y,p)
case 10:o=b.y
n=A.b7(a,o,a0,a1)
m=b.z
l=A.df(a,m,a0,a1)
if(n===o&&l===m)return b
return A.jo(a,n,l)
case 11:k=b.y
j=A.b7(a,k,a0,a1)
i=b.z
h=A.oy(a,i,a0,a1)
if(j===k&&h===i)return b
return A.l_(a,j,h)
case 12:g=b.z
a1+=g.length
f=A.df(a,g,a0,a1)
o=b.y
n=A.b7(a,o,a0,a1)
if(f===g&&n===o)return b
return A.jp(a,n,f,!0)
case 13:e=b.y
if(e<a1)return b
d=a0[e-a1]
if(d==null)return b
return d
default:throw A.d(A.f0("Attempted to substitute unexpected RTI kind "+c))}},
df(a,b,c,d){var s,r,q,p,o=b.length,n=A.iq(o)
for(s=!1,r=0;r<o;++r){q=b[r]
p=A.b7(a,q,c,d)
if(p!==q)s=!0
n[r]=p}return s?n:b},
oz(a,b,c,d){var s,r,q,p,o,n,m=b.length,l=A.iq(m)
for(s=!1,r=0;r<m;r+=3){q=b[r]
p=b[r+1]
o=b[r+2]
n=A.b7(a,o,c,d)
if(n!==o)s=!0
l.splice(r,3,q,p,n)}return s?l:b},
oy(a,b,c,d){var s,r=b.a,q=A.df(a,r,c,d),p=b.b,o=A.df(a,p,c,d),n=b.c,m=A.oz(a,n,c,d)
if(q===r&&o===p&&m===n)return b
s=new A.eN()
s.a=q
s.b=o
s.c=m
return s},
b(a,b){a[v.arrayRti]=b
return a},
oJ(a){var s=a.$S
if(s!=null){if(typeof s=="number")return A.oT(s)
return a.$S()}return null},
ll(a,b){var s
if(A.kC(b))if(a instanceof A.bd){s=A.oJ(a)
if(s!=null)return s}return A.a5(a)},
a5(a){var s
if(a instanceof A.q){s=a.$ti
return s!=null?s:A.jz(a)}if(Array.isArray(a))return A.a4(a)
return A.jz(J.c5(a))},
a4(a){var s=a[v.arrayRti],r=t.b
if(s==null)return r
if(s.constructor!==r.constructor)return r
return s},
y(a){var s=a.$ti
return s!=null?s:A.jz(a)},
jz(a){var s=a.constructor,r=s.$ccache
if(r!=null)return r
return A.oi(a,s)},
oi(a,b){var s=a instanceof A.bd?a.__proto__.__proto__.constructor:b,r=A.o0(v.typeUniverse,s.name)
b.$ccache=r
return r},
oT(a){var s,r=v.types,q=r[a]
if(typeof q=="string"){s=A.jr(v.typeUniverse,q,!1)
r[a]=s
return s}return q},
oh(a){var s,r,q,p,o=this
if(o===t.K)return A.c0(o,a,A.om)
if(!A.aR(o))if(!(o===t._))s=!1
else s=!0
else s=!0
if(s)return A.c0(o,a,A.op)
s=o.x
r=s===6?o.y:o
if(r===t.p)q=A.iu
else if(r===t.gR||r===t.di)q=A.ol
else if(r===t.N)q=A.on
else q=r===t.v?A.dc:null
if(q!=null)return A.c0(o,a,q)
if(r.x===9){p=r.y
if(r.z.every(A.p0)){o.r="$i"+p
if(p==="j")return A.c0(o,a,A.ok)
return A.c0(o,a,A.oo)}}else if(s===7)return A.c0(o,a,A.of)
return A.c0(o,a,A.od)},
c0(a,b,c){a.b=c
return a.b(b)},
og(a){var s,r=this,q=A.oc
if(!A.aR(r))if(!(r===t._))s=!1
else s=!0
else s=!0
if(s)q=A.o6
else if(r===t.K)q=A.o5
else{s=A.dh(r)
if(s)q=A.oe}r.a=q
return r.a(a)},
iv(a){var s,r=a.x
if(!A.aR(a))if(!(a===t._))if(!(a===t.aw))if(r!==7)s=r===8&&A.iv(a.y)||a===t.P||a===t.u
else s=!0
else s=!0
else s=!0
else s=!0
return s},
od(a){var s=this
if(a==null)return A.iv(s)
return A.I(v.typeUniverse,A.ll(a,s),null,s,null)},
of(a){if(a==null)return!0
return this.y.b(a)},
oo(a){var s,r=this
if(a==null)return A.iv(r)
s=r.r
if(a instanceof A.q)return!!a[s]
return!!J.c5(a)[s]},
ok(a){var s,r=this
if(a==null)return A.iv(r)
if(typeof a!="object")return!1
if(Array.isArray(a))return!0
s=r.r
if(a instanceof A.q)return!!a[s]
return!!J.c5(a)[s]},
oc(a){var s,r=this
if(a==null){s=A.dh(r)
if(s)return a}else if(r.b(a))return a
A.l6(a,r)},
oe(a){var s=this
if(a==null)return a
else if(s.b(a))return a
A.l6(a,s)},
l6(a,b){throw A.d(A.nR(A.kT(a,A.ll(a,b),A.ai(b,null))))},
kT(a,b,c){var s=A.cc(a)
return s+": type '"+A.ai(b==null?A.a5(a):b,null)+"' is not a subtype of type '"+c+"'"},
nR(a){return new A.d7("TypeError: "+a)},
a0(a,b){return new A.d7("TypeError: "+A.kT(a,null,b))},
om(a){return a!=null},
o5(a){if(a!=null)return a
throw A.d(A.a0(a,"Object"))},
op(a){return!0},
o6(a){return a},
dc(a){return!0===a||!1===a},
js(a){if(!0===a)return!0
if(!1===a)return!1
throw A.d(A.a0(a,"bool"))},
qw(a){if(!0===a)return!0
if(!1===a)return!1
if(a==null)return a
throw A.d(A.a0(a,"bool"))},
qv(a){if(!0===a)return!0
if(!1===a)return!1
if(a==null)return a
throw A.d(A.a0(a,"bool?"))},
o4(a){if(typeof a=="number")return a
throw A.d(A.a0(a,"double"))},
qy(a){if(typeof a=="number")return a
if(a==null)return a
throw A.d(A.a0(a,"double"))},
qx(a){if(typeof a=="number")return a
if(a==null)return a
throw A.d(A.a0(a,"double?"))},
iu(a){return typeof a=="number"&&Math.floor(a)===a},
n(a){if(typeof a=="number"&&Math.floor(a)===a)return a
throw A.d(A.a0(a,"int"))},
qz(a){if(typeof a=="number"&&Math.floor(a)===a)return a
if(a==null)return a
throw A.d(A.a0(a,"int"))},
l4(a){if(typeof a=="number"&&Math.floor(a)===a)return a
if(a==null)return a
throw A.d(A.a0(a,"int?"))},
ol(a){return typeof a=="number"},
l5(a){if(typeof a=="number")return a
throw A.d(A.a0(a,"num"))},
qB(a){if(typeof a=="number")return a
if(a==null)return a
throw A.d(A.a0(a,"num"))},
qA(a){if(typeof a=="number")return a
if(a==null)return a
throw A.d(A.a0(a,"num?"))},
on(a){return typeof a=="string"},
aN(a){if(typeof a=="string")return a
throw A.d(A.a0(a,"String"))},
qC(a){if(typeof a=="string")return a
if(a==null)return a
throw A.d(A.a0(a,"String"))},
jt(a){if(typeof a=="string")return a
if(a==null)return a
throw A.d(A.a0(a,"String?"))},
ov(a,b){var s,r,q
for(s="",r="",q=0;q<a.length;++q,r=", ")s+=r+A.ai(a[q],b)
return s},
l7(a4,a5,a6){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3=", "
if(a6!=null){s=a6.length
if(a5==null){a5=A.b([],t.s)
r=null}else r=a5.length
q=a5.length
for(p=s;p>0;--p)B.b.v(a5,"T"+(q+p))
for(o=t.X,n=t._,m="<",l="",p=0;p<s;++p,l=a3){k=a5.length
j=k-1-p
if(!(j>=0))return A.a(a5,j)
m=B.e.b4(m+l,a5[j])
i=a6[p]
h=i.x
if(!(h===2||h===3||h===4||h===5||i===o))if(!(i===n))k=!1
else k=!0
else k=!0
if(!k)m+=" extends "+A.ai(i,a5)}m+=">"}else{m=""
r=null}o=a4.y
g=a4.z
f=g.a
e=f.length
d=g.b
c=d.length
b=g.c
a=b.length
a0=A.ai(o,a5)
for(a1="",a2="",p=0;p<e;++p,a2=a3)a1+=a2+A.ai(f[p],a5)
if(c>0){a1+=a2+"["
for(a2="",p=0;p<c;++p,a2=a3)a1+=a2+A.ai(d[p],a5)
a1+="]"}if(a>0){a1+=a2+"{"
for(a2="",p=0;p<a;p+=3,a2=a3){a1+=a2
if(b[p+1])a1+="required "
a1+=A.ai(b[p+2],a5)+" "+b[p]}a1+="}"}if(r!=null){a5.toString
a5.length=r}return m+"("+a1+") => "+a0},
ai(a,b){var s,r,q,p,o,n,m,l=a.x
if(l===5)return"erased"
if(l===2)return"dynamic"
if(l===3)return"void"
if(l===1)return"Never"
if(l===4)return"any"
if(l===6){s=A.ai(a.y,b)
return s}if(l===7){r=a.y
s=A.ai(r,b)
q=r.x
return(q===11||q===12?"("+s+")":s)+"?"}if(l===8)return"FutureOr<"+A.ai(a.y,b)+">"
if(l===9){p=A.oA(a.y)
o=a.z
return o.length>0?p+("<"+A.ov(o,b)+">"):p}if(l===11)return A.l7(a,b,null)
if(l===12)return A.l7(a.y,b,a.z)
if(l===13){n=a.y
m=b.length
n=m-1-n
if(!(n>=0&&n<m))return A.a(b,n)
return b[n]}return"?"},
oA(a){var s=v.mangledGlobalNames[a]
if(s!=null)return s
return"minified:"+a},
o1(a,b){var s=a.tR[b]
for(;typeof s=="string";)s=a.tR[s]
return s},
o0(a,b){var s,r,q,p,o,n=a.eT,m=n[b]
if(m==null)return A.jr(a,b,!1)
else if(typeof m=="number"){s=m
r=A.d9(a,5,"#")
q=A.iq(s)
for(p=0;p<s;++p)q[p]=r
o=A.d8(a,b,q)
n[b]=o
return o}else return m},
nZ(a,b){return A.l2(a.tR,b)},
nY(a,b){return A.l2(a.eT,b)},
jr(a,b,c){var s,r=a.eC,q=r.get(b)
if(q!=null)return q
s=A.kZ(A.kX(a,null,b,c))
r.set(b,s)
return s},
io(a,b,c){var s,r,q=b.Q
if(q==null)q=b.Q=new Map()
s=q.get(c)
if(s!=null)return s
r=A.kZ(A.kX(a,b,c,!0))
q.set(c,r)
return r},
o_(a,b,c){var s,r,q,p=b.as
if(p==null)p=b.as=new Map()
s=c.at
r=p.get(s)
if(r!=null)return r
q=A.jo(a,b,c.x===10?c.z:[c])
p.set(s,q)
return q},
b6(a,b){b.a=A.og
b.b=A.oh
return b},
d9(a,b,c){var s,r,q=a.eC.get(c)
if(q!=null)return q
s=new A.ap(null,null)
s.x=b
s.at=c
r=A.b6(a,s)
a.eC.set(c,r)
return r},
l1(a,b,c){var s,r=b.at+"*",q=a.eC.get(r)
if(q!=null)return q
s=A.nW(a,b,r,c)
a.eC.set(r,s)
return s},
nW(a,b,c,d){var s,r,q
if(d){s=b.x
if(!A.aR(b))r=b===t.P||b===t.u||s===7||s===6
else r=!0
if(r)return b}q=new A.ap(null,null)
q.x=6
q.y=b
q.at=c
return A.b6(a,q)},
jq(a,b,c){var s,r=b.at+"?",q=a.eC.get(r)
if(q!=null)return q
s=A.nV(a,b,r,c)
a.eC.set(r,s)
return s},
nV(a,b,c,d){var s,r,q,p
if(d){s=b.x
if(!A.aR(b))if(!(b===t.P||b===t.u))if(s!==7)r=s===8&&A.dh(b.y)
else r=!0
else r=!0
else r=!0
if(r)return b
else if(s===1||b===t.aw)return t.P
else if(s===6){q=b.y
if(q.x===8&&A.dh(q.y))return q
else return A.kB(a,b)}}p=new A.ap(null,null)
p.x=7
p.y=b
p.at=c
return A.b6(a,p)},
l0(a,b,c){var s,r=b.at+"/",q=a.eC.get(r)
if(q!=null)return q
s=A.nT(a,b,r,c)
a.eC.set(r,s)
return s},
nT(a,b,c,d){var s,r,q
if(d){s=b.x
if(!A.aR(b))if(!(b===t._))r=!1
else r=!0
else r=!0
if(r||b===t.K)return b
else if(s===1)return A.d8(a,"a8",[b])
else if(b===t.P||b===t.u)return t.bG}q=new A.ap(null,null)
q.x=8
q.y=b
q.at=c
return A.b6(a,q)},
nX(a,b){var s,r,q=""+b+"^",p=a.eC.get(q)
if(p!=null)return p
s=new A.ap(null,null)
s.x=13
s.y=b
s.at=q
r=A.b6(a,s)
a.eC.set(q,r)
return r},
eW(a){var s,r,q,p=a.length
for(s="",r="",q=0;q<p;++q,r=",")s+=r+a[q].at
return s},
nS(a){var s,r,q,p,o,n=a.length
for(s="",r="",q=0;q<n;q+=3,r=","){p=a[q]
o=a[q+1]?"!":":"
s+=r+p+o+a[q+2].at}return s},
d8(a,b,c){var s,r,q,p=b
if(c.length>0)p+="<"+A.eW(c)+">"
s=a.eC.get(p)
if(s!=null)return s
r=new A.ap(null,null)
r.x=9
r.y=b
r.z=c
if(c.length>0)r.c=c[0]
r.at=p
q=A.b6(a,r)
a.eC.set(p,q)
return q},
jo(a,b,c){var s,r,q,p,o,n
if(b.x===10){s=b.y
r=b.z.concat(c)}else{r=c
s=b}q=s.at+(";<"+A.eW(r)+">")
p=a.eC.get(q)
if(p!=null)return p
o=new A.ap(null,null)
o.x=10
o.y=s
o.z=r
o.at=q
n=A.b6(a,o)
a.eC.set(q,n)
return n},
l_(a,b,c){var s,r,q,p,o,n=b.at,m=c.a,l=m.length,k=c.b,j=k.length,i=c.c,h=i.length,g="("+A.eW(m)
if(j>0){s=l>0?",":""
g+=s+"["+A.eW(k)+"]"}if(h>0){s=l>0?",":""
g+=s+"{"+A.nS(i)+"}"}r=n+(g+")")
q=a.eC.get(r)
if(q!=null)return q
p=new A.ap(null,null)
p.x=11
p.y=b
p.z=c
p.at=r
o=A.b6(a,p)
a.eC.set(r,o)
return o},
jp(a,b,c,d){var s,r=b.at+("<"+A.eW(c)+">"),q=a.eC.get(r)
if(q!=null)return q
s=A.nU(a,b,c,r,d)
a.eC.set(r,s)
return s},
nU(a,b,c,d,e){var s,r,q,p,o,n,m,l
if(e){s=c.length
r=A.iq(s)
for(q=0,p=0;p<s;++p){o=c[p]
if(o.x===1){r[p]=o;++q}}if(q>0){n=A.b7(a,b,r,0)
m=A.df(a,c,r,0)
return A.jp(a,n,m,c!==m)}}l=new A.ap(null,null)
l.x=12
l.y=b
l.z=c
l.at=d
return A.b6(a,l)},
kX(a,b,c,d){return{u:a,e:b,r:c,s:[],p:0,n:d}},
kZ(a){var s,r,q,p,o,n,m,l,k,j,i,h=a.r,g=a.s
for(s=h.length,r=0;r<s;){q=h.charCodeAt(r)
if(q>=48&&q<=57)r=A.nM(r+1,q,h,g)
else if((((q|32)>>>0)-97&65535)<26||q===95||q===36)r=A.kY(a,r,h,g,!1)
else if(q===46)r=A.kY(a,r,h,g,!0)
else{++r
switch(q){case 44:break
case 58:g.push(!1)
break
case 33:g.push(!0)
break
case 59:g.push(A.b5(a.u,a.e,g.pop()))
break
case 94:g.push(A.nX(a.u,g.pop()))
break
case 35:g.push(A.d9(a.u,5,"#"))
break
case 64:g.push(A.d9(a.u,2,"@"))
break
case 126:g.push(A.d9(a.u,3,"~"))
break
case 60:g.push(a.p)
a.p=g.length
break
case 62:p=a.u
o=g.splice(a.p)
A.jn(a.u,a.e,o)
a.p=g.pop()
n=g.pop()
if(typeof n=="string")g.push(A.d8(p,n,o))
else{m=A.b5(p,a.e,n)
switch(m.x){case 11:g.push(A.jp(p,m,o,a.n))
break
default:g.push(A.jo(p,m,o))
break}}break
case 38:A.nN(a,g)
break
case 42:p=a.u
g.push(A.l1(p,A.b5(p,a.e,g.pop()),a.n))
break
case 63:p=a.u
g.push(A.jq(p,A.b5(p,a.e,g.pop()),a.n))
break
case 47:p=a.u
g.push(A.l0(p,A.b5(p,a.e,g.pop()),a.n))
break
case 40:g.push(a.p)
a.p=g.length
break
case 41:p=a.u
l=new A.eN()
k=p.sEA
j=p.sEA
n=g.pop()
if(typeof n=="number")switch(n){case-1:k=g.pop()
break
case-2:j=g.pop()
break
default:g.push(n)
break}else g.push(n)
o=g.splice(a.p)
A.jn(a.u,a.e,o)
a.p=g.pop()
l.a=o
l.b=k
l.c=j
g.push(A.l_(p,A.b5(p,a.e,g.pop()),l))
break
case 91:g.push(a.p)
a.p=g.length
break
case 93:o=g.splice(a.p)
A.jn(a.u,a.e,o)
a.p=g.pop()
g.push(o)
g.push(-1)
break
case 123:g.push(a.p)
a.p=g.length
break
case 125:o=g.splice(a.p)
A.nP(a.u,a.e,o)
a.p=g.pop()
g.push(o)
g.push(-2)
break
default:throw"Bad character "+q}}}i=g.pop()
return A.b5(a.u,a.e,i)},
nM(a,b,c,d){var s,r,q=b-48
for(s=c.length;a<s;++a){r=c.charCodeAt(a)
if(!(r>=48&&r<=57))break
q=q*10+(r-48)}d.push(q)
return a},
kY(a,b,c,d,e){var s,r,q,p,o,n,m=b+1
for(s=c.length;m<s;++m){r=c.charCodeAt(m)
if(r===46){if(e)break
e=!0}else{if(!((((r|32)>>>0)-97&65535)<26||r===95||r===36))q=r>=48&&r<=57
else q=!0
if(!q)break}}p=c.substring(b,m)
if(e){s=a.u
o=a.e
if(o.x===10)o=o.y
n=A.o1(s,o.y)[p]
if(n==null)A.D('No "'+p+'" in "'+A.mJ(o)+'"')
d.push(A.io(s,o,n))}else d.push(p)
return m},
nN(a,b){var s=b.pop()
if(0===s){b.push(A.d9(a.u,1,"0&"))
return}if(1===s){b.push(A.d9(a.u,4,"1&"))
return}throw A.d(A.f0("Unexpected extended operation "+A.r(s)))},
b5(a,b,c){if(typeof c=="string")return A.d8(a,c,a.sEA)
else if(typeof c=="number"){b.toString
return A.nO(a,b,c)}else return c},
jn(a,b,c){var s,r=c.length
for(s=0;s<r;++s)c[s]=A.b5(a,b,c[s])},
nP(a,b,c){var s,r=c.length
for(s=2;s<r;s+=3)c[s]=A.b5(a,b,c[s])},
nO(a,b,c){var s,r,q=b.x
if(q===10){if(c===0)return b.y
s=b.z
r=s.length
if(c<=r)return s[c-1]
c-=r
b=b.y
q=b.x}else if(c===0)return b
if(q!==9)throw A.d(A.f0("Indexed base must be an interface type"))
s=b.z
if(c<=s.length)return s[c-1]
throw A.d(A.f0("Bad index "+c+" for "+b.t(0)))},
I(a,b,c,d,e){var s,r,q,p,o,n,m,l,k,j
if(b===d)return!0
if(!A.aR(d))if(!(d===t._))s=!1
else s=!0
else s=!0
if(s)return!0
r=b.x
if(r===4)return!0
if(A.aR(b))return!1
if(b.x!==1)s=!1
else s=!0
if(s)return!0
q=r===13
if(q)if(A.I(a,c[b.y],c,d,e))return!0
p=d.x
s=b===t.P||b===t.u
if(s){if(p===8)return A.I(a,b,c,d.y,e)
return d===t.P||d===t.u||p===7||p===6}if(d===t.K){if(r===8)return A.I(a,b.y,c,d,e)
if(r===6)return A.I(a,b.y,c,d,e)
return r!==7}if(r===6)return A.I(a,b.y,c,d,e)
if(p===6){s=A.kB(a,d)
return A.I(a,b,c,s,e)}if(r===8){if(!A.I(a,b.y,c,d,e))return!1
return A.I(a,A.kA(a,b),c,d,e)}if(r===7){s=A.I(a,t.P,c,d,e)
return s&&A.I(a,b.y,c,d,e)}if(p===8){if(A.I(a,b,c,d.y,e))return!0
return A.I(a,b,c,A.kA(a,d),e)}if(p===7){s=A.I(a,b,c,t.P,e)
return s||A.I(a,b,c,d.y,e)}if(q)return!1
s=r!==11
if((!s||r===12)&&d===t.Y)return!0
if(p===12){if(b===t.cj)return!0
if(r!==12)return!1
o=b.z
n=d.z
m=o.length
if(m!==n.length)return!1
c=c==null?o:o.concat(c)
e=e==null?n:n.concat(e)
for(l=0;l<m;++l){k=o[l]
j=n[l]
if(!A.I(a,k,c,j,e)||!A.I(a,j,e,k,c))return!1}return A.l8(a,b.y,c,d.y,e)}if(p===11){if(b===t.cj)return!0
if(s)return!1
return A.l8(a,b,c,d,e)}if(r===9){if(p!==9)return!1
return A.oj(a,b,c,d,e)}return!1},
l8(a3,a4,a5,a6,a7){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2
if(!A.I(a3,a4.y,a5,a6.y,a7))return!1
s=a4.z
r=a6.z
q=s.a
p=r.a
o=q.length
n=p.length
if(o>n)return!1
m=n-o
l=s.b
k=r.b
j=l.length
i=k.length
if(o+j<n+i)return!1
for(h=0;h<o;++h){g=q[h]
if(!A.I(a3,p[h],a7,g,a5))return!1}for(h=0;h<m;++h){g=l[h]
if(!A.I(a3,p[o+h],a7,g,a5))return!1}for(h=0;h<i;++h){g=l[m+h]
if(!A.I(a3,k[h],a7,g,a5))return!1}f=s.c
e=r.c
d=f.length
c=e.length
for(b=0,a=0;a<c;a+=3){a0=e[a]
for(;!0;){if(b>=d)return!1
a1=f[b]
b+=3
if(a0<a1)return!1
a2=f[b-2]
if(a1<a0){if(a2)return!1
continue}g=e[a+1]
if(a2&&!g)return!1
g=f[b-1]
if(!A.I(a3,e[a+2],a7,g,a5))return!1
break}}for(;b<d;){if(f[b+1])return!1
b+=3}return!0},
oj(a,b,c,d,e){var s,r,q,p,o,n,m,l=b.y,k=d.y
for(;l!==k;){s=a.tR[l]
if(s==null)return!1
if(typeof s=="string"){l=s
continue}r=s[k]
if(r==null)return!1
q=r.length
p=q>0?new Array(q):v.typeUniverse.sEA
for(o=0;o<q;++o)p[o]=A.io(a,b,r[o])
return A.l3(a,p,null,c,d.z,e)}n=b.z
m=d.z
return A.l3(a,n,null,c,m,e)},
l3(a,b,c,d,e,f){var s,r,q,p=b.length
for(s=0;s<p;++s){r=b[s]
q=e[s]
if(!A.I(a,r,d,q,f))return!1}return!0},
dh(a){var s,r=a.x
if(!(a===t.P||a===t.u))if(!A.aR(a))if(r!==7)if(!(r===6&&A.dh(a.y)))s=r===8&&A.dh(a.y)
else s=!0
else s=!0
else s=!0
else s=!0
return s},
p0(a){var s
if(!A.aR(a))if(!(a===t._))s=!1
else s=!0
else s=!0
return s},
aR(a){var s=a.x
return s===2||s===3||s===4||s===5||a===t.X},
l2(a,b){var s,r,q=Object.keys(b),p=q.length
for(s=0;s<p;++s){r=q[s]
a[r]=b[r]}},
iq(a){return a>0?new Array(a):v.typeUniverse.sEA},
ap:function ap(a,b){var _=this
_.a=a
_.b=b
_.w=_.r=_.c=null
_.x=0
_.at=_.as=_.Q=_.z=_.y=null},
eN:function eN(){this.c=this.b=this.a=null},
eM:function eM(){},
d7:function d7(a){this.a=a},
nF(){var s,r,q={}
if(self.scheduleImmediate!=null)return A.oE()
if(self.MutationObserver!=null&&self.document!=null){s=self.document.createElement("div")
r=self.document.createElement("span")
q.a=null
new self.MutationObserver(A.bB(new A.hL(q),1)).observe(s,{childList:true})
return new A.hK(q,s,r)}else if(self.setImmediate!=null)return A.oF()
return A.oG()},
nG(a){self.scheduleImmediate(A.bB(new A.hM(t.M.a(a)),0))},
nH(a){self.setImmediate(A.bB(new A.hN(t.M.a(a)),0))},
nI(a){t.M.a(a)
A.nQ(0,a)},
nQ(a,b){var s=new A.il()
s.eM(a,b)
return s},
jC(a){return new A.eJ(new A.G($.A,a.l("G<0>")),a.l("eJ<0>"))},
jx(a,b){a.$2(0,null)
b.b=!0
return b.a},
ju(a,b){A.o7(a,b)},
jw(a,b){b.bQ(a)},
jv(a,b){b.cs(A.a1(a),A.af(a))},
o7(a,b){var s,r,q=new A.is(b),p=new A.it(b)
if(a instanceof A.G)a.dH(q,p,t.z)
else{s=t.z
if(t.c.b(a))a.cE(q,p,s)
else{r=new A.G($.A,t.d)
r.a=8
r.c=a
r.dH(q,p,s)}}},
jD(a){var s=function(b,c){return function(d,e){while(true)try{b(d,e)
break}catch(r){e=r
d=c}}}(a,1)
return $.A.e3(new A.iy(s),t.H,t.p,t.z)},
qh(a){return new A.bY(a,1)},
kU(){return B.fR},
kV(a){return new A.bY(a,3)},
l9(a,b){return new A.d6(a,b.l("d6<0>"))},
f1(a,b){var s=A.c3(a,"error",t.K)
return new A.c8(s,b==null?A.jT(a):b)},
jT(a){var s
if(t.Q.b(a)){s=a.gbz()
if(s!=null)return s}return B.ax},
jl(a,b){var s,r,q
for(s=t.d;r=a.a,(r&4)!==0;)a=s.a(a.c)
if((r&24)!==0){q=b.bK()
b.c2(a)
A.bX(b,q)}else{q=t.F.a(b.c)
b.a=b.a&1|4
b.c=a
a.dw(q)}},
bX(a,a0){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c={},b=c.a=a
for(s=t.n,r=t.F,q=t.c;!0;){p={}
o=b.a
n=(o&16)===0
m=!n
if(a0==null){if(m&&(o&1)===0){l=s.a(b.c)
A.iw(l.a,l.b)}return}p.a=a0
k=a0.a
for(b=a0;k!=null;b=k,k=j){b.a=null
A.bX(c.a,b)
p.a=k
j=k.a}o=c.a
i=o.c
p.b=m
p.c=i
if(n){h=b.c
h=(h&1)!==0||(h&15)===8}else h=!0
if(h){g=b.b.b
if(m){o=o.b===g
o=!(o||o)}else o=!1
if(o){s.a(i)
A.iw(i.a,i.b)
return}f=$.A
if(f!==g)$.A=g
else f=null
b=b.c
if((b&15)===8)new A.i4(p,c,m).$0()
else if(n){if((b&1)!==0)new A.i3(p,i).$0()}else if((b&2)!==0)new A.i2(c,p).$0()
if(f!=null)$.A=f
b=p.c
if(q.b(b)){o=p.a.$ti
o=o.l("a8<2>").b(b)||!o.z[1].b(b)}else o=!1
if(o){q.a(b)
e=p.a.b
if((b.a&24)!==0){d=r.a(e.c)
e.c=null
a0=e.bL(d)
e.a=b.a&30|e.a&1
e.c=b.c
c.a=b
continue}else A.jl(b,e)
return}}e=p.a.b
d=r.a(e.c)
e.c=null
a0=e.bL(d)
b=p.b
o=p.c
if(!b){e.$ti.c.a(o)
e.a=8
e.c=o}else{s.a(o)
e.a=e.a&1|16
e.c=o}c.a=e
b=e}},
ot(a,b){var s
if(t.C.b(a))return b.e3(a,t.z,t.K,t.l)
s=t.x
if(s.b(a))return s.a(a)
throw A.d(A.jS(a,"onError",u.b))},
os(){var s,r
for(s=$.c1;s!=null;s=$.c1){$.de=null
r=s.b
$.c1=r
if(r==null)$.dd=null
s.a.$0()}},
ox(){$.jA=!0
try{A.os()}finally{$.de=null
$.jA=!1
if($.c1!=null)$.jK().$1(A.le())}},
lc(a){var s=new A.eK(a),r=$.dd
if(r==null){$.c1=$.dd=s
if(!$.jA)$.jK().$1(A.le())}else $.dd=r.b=s},
ow(a){var s,r,q,p=$.c1
if(p==null){A.lc(a)
$.de=$.dd
return}s=new A.eK(a)
r=$.de
if(r==null){s.b=p
$.c1=$.de=s}else{q=r.b
s.b=q
$.de=r.b=s
if(q==null)$.dd=s}},
p7(a){var s,r=null,q=$.A
if(B.f===q){A.bA(r,r,B.f,a)
return}s=!1
if(s){A.bA(r,r,q,t.M.a(a))
return}A.bA(r,r,q,t.M.a(q.dM(a)))},
pW(a,b){A.c3(a,"stream",t.K)
return new A.eS(b.l("eS<0>"))},
iw(a,b){A.ow(new A.ix(a,b))},
la(a,b,c,d,e){var s,r=$.A
if(r===c)return d.$0()
$.A=c
s=r
try{r=d.$0()
return r}finally{$.A=s}},
lb(a,b,c,d,e,f,g){var s,r=$.A
if(r===c)return d.$1(e)
$.A=c
s=r
try{r=d.$1(e)
return r}finally{$.A=s}},
ou(a,b,c,d,e,f,g,h,i){var s,r=$.A
if(r===c)return d.$2(e,f)
$.A=c
s=r
try{r=d.$2(e,f)
return r}finally{$.A=s}},
bA(a,b,c,d){t.M.a(d)
if(B.f!==c)d=c.dM(d)
A.lc(d)},
hL:function hL(a){this.a=a},
hK:function hK(a,b,c){this.a=a
this.b=b
this.c=c},
hM:function hM(a){this.a=a},
hN:function hN(a){this.a=a},
il:function il(){},
im:function im(a,b){this.a=a
this.b=b},
eJ:function eJ(a,b){this.a=a
this.b=!1
this.$ti=b},
is:function is(a){this.a=a},
it:function it(a){this.a=a},
iy:function iy(a){this.a=a},
bY:function bY(a,b){this.a=a
this.b=b},
c_:function c_(a,b){var _=this
_.a=a
_.d=_.c=_.b=null
_.$ti=b},
d6:function d6(a,b){this.a=a
this.$ti=b},
c8:function c8(a,b){this.a=a
this.b=b},
eL:function eL(){},
bx:function bx(a,b){this.a=a
this.$ti=b},
aM:function aM(a,b,c,d,e){var _=this
_.a=null
_.b=a
_.c=b
_.d=c
_.e=d
_.$ti=e},
G:function G(a,b){var _=this
_.a=0
_.b=a
_.c=null
_.$ti=b},
hV:function hV(a,b){this.a=a
this.b=b},
i1:function i1(a,b){this.a=a
this.b=b},
hY:function hY(a){this.a=a},
hZ:function hZ(a){this.a=a},
i_:function i_(a,b,c){this.a=a
this.b=b
this.c=c},
hX:function hX(a,b){this.a=a
this.b=b},
i0:function i0(a,b){this.a=a
this.b=b},
hW:function hW(a,b,c){this.a=a
this.b=b
this.c=c},
i4:function i4(a,b,c){this.a=a
this.b=b
this.c=c},
i5:function i5(a){this.a=a},
i3:function i3(a,b){this.a=a
this.b=b},
i2:function i2(a,b){this.a=a
this.b=b},
eK:function eK(a){this.a=a
this.b=null},
bS:function bS(){},
fW:function fW(a,b){this.a=a
this.b=b},
fX:function fX(a,b){this.a=a
this.b=b},
es:function es(){},
et:function et(){},
eS:function eS(a){this.$ti=a},
da:function da(){},
ix:function ix(a,b){this.a=a
this.b=b},
eR:function eR(){},
ig:function ig(a,b){this.a=a
this.b=b},
ih:function ih(a,b,c){this.a=a
this.b=b
this.c=c},
mu(a,b,c,d){var s
if(b==null){if(a==null)return new A.ah(c.l("@<0>").D(d).l("ah<1,2>"))
s=A.lg()}else{if(a==null)a=A.oK()
s=A.lg()}return A.nK(s,a,b,c,d)},
e2(a,b,c){return b.l("@<0>").D(c).l("j3<1,2>").a(A.li(a,new A.ah(b.l("@<0>").D(c).l("ah<1,2>"))))},
H(a,b){return new A.ah(a.l("@<0>").D(b).l("ah<1,2>"))},
nK(a,b,c,d,e){var s=c!=null?c:new A.ie(d)
return new A.cV(a,b,s,d.l("@<0>").D(e).l("cV<1,2>"))},
mv(a){return new A.cW(a.l("cW<0>"))},
jm(){var s=Object.create(null)
s["<non-identifier-key>"]=s
delete s["<non-identifier-key>"]
return s},
nL(a,b,c){var s=new A.by(a,b,c.l("by<0>"))
s.c=a.e
return s},
o8(a,b){return J.aj(a,b)},
o9(a){return J.dk(a)},
mq(a,b,c){var s,r
if(A.jB(a)){if(b==="("&&c===")")return"(...)"
return b+"..."+c}s=A.b([],t.s)
B.b.v($.ae,a)
try{A.oq(a,s)}finally{if(0>=$.ae.length)return A.a($.ae,-1)
$.ae.pop()}r=A.kG(b,t.R.a(s),", ")+c
return r.charCodeAt(0)==0?r:r},
j_(a,b,c){var s,r
if(A.jB(a))return b+"..."+c
s=new A.bs(b)
B.b.v($.ae,a)
try{r=s
r.a=A.kG(r.a,a,", ")}finally{if(0>=$.ae.length)return A.a($.ae,-1)
$.ae.pop()}s.a+=c
r=s.a
return r.charCodeAt(0)==0?r:r},
jB(a){var s,r
for(s=$.ae.length,r=0;r<s;++r)if(a===$.ae[r])return!0
return!1},
oq(a,b){var s,r,q,p,o,n,m,l=a.gU(a),k=0,j=0
while(!0){if(!(k<80||j<3))break
if(!l.B())return
s=A.r(l.gE())
B.b.v(b,s)
k+=s.length+2;++j}if(!l.B()){if(j<=5)return
if(0>=b.length)return A.a(b,-1)
r=b.pop()
if(0>=b.length)return A.a(b,-1)
q=b.pop()}else{p=l.gE();++j
if(!l.B()){if(j<=4){B.b.v(b,A.r(p))
return}r=A.r(p)
if(0>=b.length)return A.a(b,-1)
q=b.pop()
k+=r.length+2}else{o=l.gE();++j
for(;l.B();p=o,o=n){n=l.gE();++j
if(j>100){while(!0){if(!(k>75&&j>3))break
if(0>=b.length)return A.a(b,-1)
k-=b.pop().length+2;--j}B.b.v(b,"...")
return}}q=A.r(p)
r=A.r(o)
k+=r.length+q.length+4}}if(j>b.length+2){k+=5
m="..."}else m=null
while(!0){if(!(k>80&&b.length>3))break
if(0>=b.length)return A.a(b,-1)
k-=b.pop().length+2
if(m==null){k+=5
m="..."}}if(m!=null)B.b.v(b,m)
B.b.v(b,q)
B.b.v(b,r)},
j5(a){var s,r={}
if(A.jB(a))return"{...}"
s=new A.bs("")
try{B.b.v($.ae,a)
s.a+="{"
r.a=!0
a.aC(0,new A.fD(r,s))
s.a+="}"}finally{if(0>=$.ae.length)return A.a($.ae,-1)
$.ae.pop()}r=s.a
return r.charCodeAt(0)==0?r:r},
cV:function cV(a,b,c,d){var _=this
_.w=a
_.x=b
_.y=c
_.a=0
_.f=_.e=_.d=_.c=_.b=null
_.r=0
_.$ti=d},
ie:function ie(a){this.a=a},
cW:function cW(a){var _=this
_.a=0
_.f=_.e=_.d=_.c=_.b=null
_.r=0
_.$ti=a},
eQ:function eQ(a){this.a=a
this.b=null},
by:function by(a,b,c){var _=this
_.a=a
_.b=b
_.d=_.c=null
_.$ti=c},
cq:function cq(){},
cv:function cv(){},
u:function u(){},
cw:function cw(){},
fD:function fD(a,b){this.a=a
this.b=b},
V:function V(){},
cY:function cY(a,b){this.a=a
this.$ti=b},
cZ:function cZ(a,b,c){var _=this
_.a=a
_.b=b
_.c=null
_.$ti=c},
cG:function cG(){},
d4:function d4(){},
cX:function cX(){},
db:function db(){},
mS(a,b,c,d){var s,r
if(b instanceof Uint8Array){s=b
d=s.length
if(d-c<15)return null
r=A.mT(a,s,c,d)
if(r!=null&&a)if(r.indexOf("\ufffd")>=0)return null
return r}return null},
mT(a,b,c,d){var s=a?$.lH():$.lG()
if(s==null)return null
if(0===c&&d===b.length)return A.kK(s,b)
return A.kK(s,b.subarray(c,A.ao(c,d,b.length)))},
kK(a,b){var s,r
try{s=a.decode(b)
return s}catch(r){}return null},
kh(a,b,c){return new A.cu(a,b)},
oa(a){return a.e7()},
nJ(a,b){return new A.eP(a,[],A.lh())},
kW(a,b,c){var s,r,q=new A.bs("")
if(c==null)s=A.nJ(q,b)
else s=new A.ib(c,0,q,[],A.lh())
s.aS(a)
r=q.a
return r.charCodeAt(0)==0?r:r},
o3(a){switch(a){case 65:return"Missing extension byte"
case 67:return"Unexpected extension byte"
case 69:return"Invalid UTF-8 byte"
case 71:return"Overlong encoding"
case 73:return"Out of unicode range"
case 75:return"Encoded surrogate"
case 77:return"Unfinished UTF-8 octet sequence"
default:return""}},
o2(a,b,c){var s,r,q,p,o=c-b,n=new Uint8Array(o)
for(s=a.length,r=0;r<o;++r){q=b+r
if(!(q<s))return A.a(a,q)
p=a[q]
if((p&4294967040)>>>0!==0)p=255
if(!(r<o))return A.a(n,r)
n[r]=p}return n},
hh:function hh(){},
hg:function hg(){},
eV:function eV(){},
bI:function bI(){},
bf:function bf(){},
du:function du(){},
cu:function cu(a,b){this.a=a
this.b=b},
dZ:function dZ(a,b){this.a=a
this.b=b},
dY:function dY(){},
e_:function e_(a,b){this.a=a
this.b=b},
ic:function ic(){},
id:function id(a,b){this.a=a
this.b=b},
i9:function i9(){},
ia:function ia(a,b){this.a=a
this.b=b},
eP:function eP(a,b,c){this.c=a
this.a=b
this.b=c},
ib:function ib(a,b,c,d,e){var _=this
_.f=a
_.a$=b
_.c=c
_.a=d
_.b=e},
e0:function e0(){},
e1:function e1(a){this.a=a},
eD:function eD(a){this.a=a},
ip:function ip(a){this.a=a
this.b=16
this.c=0},
eX:function eX(){},
oY(a){var s=A.mD(a,null)
if(s!=null)return s
throw A.d(A.iX(a,null,null))},
m6(a){if(a instanceof A.bd)return a.t(0)
return"Instance of '"+A.fN(a)+"'"},
m7(a,b){a=A.d(a)
if(a==null)a=t.K.a(a)
a.stack=b.t(0)
throw a
throw A.d("unreachable")},
U(a,b,c,d){var s,r=J.j0(a,d)
if(a!==0&&b!=null)for(s=0;s<a;++s)r[s]=b
return r},
kj(a,b){var s,r=A.b([],b.l("o<0>"))
for(s=J.as(a);s.B();)B.b.v(r,b.a(s.gE()))
return r},
kk(a,b,c){var s=A.mw(a,c)
return s},
mw(a,b){var s,r
if(Array.isArray(a))return A.b(a.slice(0),b.l("o<0>"))
s=A.b([],b.l("o<0>"))
for(r=J.as(a);r.B();)B.b.v(s,r.gE())
return s},
j4(a,b,c,d){var s,r=c?J.kb(a,d):J.j0(a,d)
for(s=0;s<a;++s)B.b.h(r,s,b.$1(s))
return r},
fY(a,b,c){var s,r
if(Array.isArray(a)){s=a
r=s.length
c=A.ao(b,c,r)
return A.kx(b>0||c<r?s.slice(b,c):s)}if(t.bm.b(a))return A.mF(a,b,A.ao(b,c,a.length))
return A.mP(a,b,c)},
mP(a,b,c){var s,r,q,p,o=null
if(b<0)throw A.d(A.O(b,0,a.length,o,o))
s=c==null
if(!s&&c<b)throw A.d(A.O(c,b,a.length,o,o))
r=J.as(a)
for(q=0;q<b;++q)if(!r.B())throw A.d(A.O(b,0,q,o,o))
p=[]
if(s)for(;r.B();)p.push(r.gE())
else for(q=b;q<c;++q){if(!r.B())throw A.d(A.O(c,b,q,o,o))
p.push(r.gE())}return A.kx(p)},
kG(a,b,c){var s=J.as(b)
if(!s.B())return a
if(c.length===0){do a+=A.r(s.gE())
while(s.B())}else{a+=A.r(s.gE())
for(;s.B();)a=a+c+A.r(s.gE())}return a},
kF(){var s,r
if(A.aP($.lM()))return A.af(new Error())
try{throw A.d("")}catch(r){s=A.af(r)
return s}},
m4(a,b){var s
if(Math.abs(a)<=864e13)s=!1
else s=!0
if(s)A.D(A.bE("DateTime is outside valid range: "+a,null))
A.c3(!0,"isUtc",t.v)
return new A.bg(a,!0)},
k_(a){var s=Math.abs(a),r=a<0?"-":""
if(s>=1000)return""+a
if(s>=100)return r+"0"+s
if(s>=10)return r+"00"+s
return r+"000"+s},
m5(a){var s=Math.abs(a),r=a<0?"-":"+"
if(s>=1e5)return r+s
return r+"0"+s},
k0(a){if(a>=100)return""+a
if(a>=10)return"0"+a
return"00"+a},
az(a){if(a>=10)return""+a
return"0"+a},
cc(a){if(typeof a=="number"||A.dc(a)||a==null)return J.bD(a)
if(typeof a=="string")return JSON.stringify(a)
return A.m6(a)},
f0(a){return new A.c7(a)},
bE(a,b){return new A.at(!1,null,b,a)},
jS(a,b,c){return new A.at(!0,a,b,c)},
mI(a){var s=null
return new A.bQ(s,s,!1,s,s,a)},
O(a,b,c,d,e){return new A.bQ(b,c,!0,a,d,"Invalid value")},
ao(a,b,c){if(0>a||a>c)throw A.d(A.O(a,0,c,"start",null))
if(b!=null){if(a>b||b>c)throw A.d(A.O(b,a,c,"end",null))
return b}return c},
en(a,b){if(a<0)throw A.d(A.O(a,0,null,b,null))
return a},
fr(a,b,c,d,e){var s=A.n(e==null?J.aS(b):e)
return new A.dF(s,!0,a,c,"Index out of range")},
a_(a){return new A.eC(a)},
eA(a){return new A.ez(a)},
fV(a){return new A.bR(a)},
ay(a){return new A.ds(a)},
iX(a,b,c){return new A.dz(a,b,c)},
ka(a,b,c){if(a<=0)return new A.bi(c.l("bi<0>"))
return new A.cU(a,b,c.l("cU<0>"))},
jH(a){A.lo(A.r(a))},
bg:function bg(a,b){this.a=a
this.b=b},
hQ:function hQ(){},
x:function x(){},
c7:function c7(a){this.a=a},
b0:function b0(){},
e9:function e9(){},
at:function at(a,b,c,d){var _=this
_.a=a
_.b=b
_.c=c
_.d=d},
bQ:function bQ(a,b,c,d,e,f){var _=this
_.e=a
_.f=b
_.a=c
_.b=d
_.c=e
_.d=f},
dF:function dF(a,b,c,d,e){var _=this
_.f=a
_.a=b
_.b=c
_.c=d
_.d=e},
eC:function eC(a){this.a=a},
ez:function ez(a){this.a=a},
bR:function bR(a){this.a=a},
ds:function ds(a){this.a=a},
ea:function ea(){},
cI:function cI(){},
dt:function dt(a){this.a=a},
hU:function hU(a){this.a=a},
dz:function dz(a,b,c){this.a=a
this.b=b
this.c=c},
k:function k(){},
cU:function cU(a,b,c){this.a=a
this.b=b
this.$ti=c},
E:function E(){},
F:function F(){},
q:function q(){},
eT:function eT(){},
bs:function bs(a){this.a=a},
hS(a,b,c,d,e){var s=A.oC(new A.hT(c),t.E)
if(s!=null&&!0)J.lQ(a,b,s,!1)
return new A.cT(a,b,s,!1,e.l("cT<0>"))},
oC(a,b){var s=$.A
if(s===B.f)return a
return s.hV(a,b)},
bc:function bc(){},
bJ:function bJ(){},
fd:function fd(){},
h:function h(){},
aA:function aA(){},
bK:function bK(){},
aH:function aH(){},
aW:function aW(){},
b4:function b4(){},
iU:function iU(a){this.$ti=a},
hR:function hR(a,b,c,d){var _=this
_.a=a
_.b=b
_.c=c
_.$ti=d},
cT:function cT(a,b,c,d,e){var _=this
_.b=a
_.c=b
_.d=c
_.e=d
_.$ti=e},
hT:function hT(a){this.a=a},
ii:function ii(){},
ij:function ij(a,b){this.a=a
this.b=b},
ik:function ik(a,b){this.a=a
this.b=b},
hI:function hI(){},
hJ:function hJ(a,b){this.a=a
this.b=b},
eU:function eU(a,b){this.a=a
this.b=b},
eH:function eH(a,b){this.a=a
this.b=b
this.c=!1},
p4(a,b){var s=new A.G($.A,b.l("G<0>")),r=new A.bx(s,b.l("bx<0>"))
a.then(A.bB(new A.iO(r,b),1),A.bB(new A.iP(r),1))
return s},
iO:function iO(a,b){this.a=a
this.b=b},
iP:function iP(a){this.a=a},
fF:function fF(a){this.a=a},
i6:function i6(){},
iT(a){return new A.f_(a,null,null)},
f_:function f_(a,b,c){this.a=a
this.b=b
this.c=c},
bO(a,b,c,d){var s,r
if(t.ak.b(a))s=A.N(a.buffer,a.byteOffset,a.byteLength)
else s=t.L.b(a)?a:A.kj(t.R.a(a),t.p)
r=new A.dH(s,d,d,b)
r.e=c==null?s.length:c
return r},
dI:function dI(){},
dH:function dH(a,b,c,d){var _=this
_.a=a
_.b=b
_.c=c
_.d=d
_.e=$},
ko(a){return new A.fJ(new Uint8Array(32768))},
fK:function fK(){},
fJ:function fJ(a){this.a=0
this.c=a},
ir:function ir(){},
bM(a){var s=new A.fm()
s.eE(a)
return s},
fm:function fm(){this.a=$
this.b=0
this.c=2147483647},
k7(a){var s=A.bM(B.V),r=A.bM(B.a6)
r=new A.dG(A.bO(a,0,null,0),A.ko(null),s,r)
r.b=!0
r.di()
return r},
dG:function dG(a,b,c,d){var _=this
_.a=a
_.b=!1
_.c=b
_.e=_.d=0
_.r=c
_.w=d},
hH:function hH(){},
hG:function hG(){},
bT:function bT(){this.a=$},
h0:function h0(){},
h3:function h3(){},
h4:function h4(){},
h2:function h2(a){this.a=a},
h5:function h5(a){this.a=a},
h6:function h6(a){this.a=a},
h7:function h7(a){this.a=a},
h1:function h1(a,b,c){this.a=a
this.b=b
this.c=c},
h8:function h8(a){this.a=a},
p2(){return A.oH(new A.iL(),null)},
iL:function iL(){},
ce:function ce(a){this.a=null
this.b=a},
jU(a){var s,r,q=new A.f6()
if(!A.f7(a))A.D(A.f("Not a bitmap file."))
a.d+=2
s=a.j()
r=$.z()
r[0]=s
s=$.M()
if(0>=s.length)return A.a(s,0)
q.a=s[0]
a.d+=4
r[0]=a.j()
if(0>=s.length)return A.a(s,0)
q.b=s[0]
return q},
f7(a){if(a.c-a.d<2)return!1
return A.i(a,null,0).k()===19778},
lV(a,b){var s,r,q,p,o,n,m,l=b==null?A.jU(a):b,k=a.j(),j=a.j(),i=$.z()
i[0]=j
j=$.M()
if(0>=j.length)return A.a(j,0)
s=j[0]
i[0]=a.j()
if(0>=j.length)return A.a(j,0)
r=j[0]
q=a.k()
p=a.k()
o=a.j()
n=A.e2([0,B.v,3,B.u],t.p,t.G).m(0,o)
if(n==null)A.D(A.f("Bitmap compression "+o+" is not supported yet."))
o=a.j()
i[0]=a.j()
if(0>=j.length)return A.a(j,0)
m=j[0]
i[0]=a.j()
if(0>=j.length)return A.a(j,0)
j=new A.aT(l,r,s,k,q,p,n,o,m,j[0],a.j(),a.j())
j.cP(a,b)
return j},
c9:function c9(a){this.b=a},
f6:function f6(){this.b=this.a=$},
aT:function aT(a,b,c,d,e,f,g,h,i,j,k,l){var _=this
_.d=a
_.e=b
_.f=c
_.r=d
_.w=e
_.x=f
_.y=g
_.z=h
_.Q=i
_.as=j
_.at=k
_.ax=l
_.cy=_.cx=_.CW=_.ch=_.ay=null
_.b=_.a=0},
f9:function f9(a,b,c){this.a=a
this.b=b
this.c=c},
dm:function dm(){this.a=$
this.b=null},
f8:function f8(a,b,c){this.a=a
this.b=b
this.c=c},
fc:function fc(){this.a=$
this.b=null},
fa:function fa(){},
fb:function fb(){},
dv:function dv(){},
cm:function cm(a,b){var _=this
_.r=a
_.b=_.a=0
_.c=b},
dw:function dw(){var _=this
_.a=null
_.f=_.e=_.c=_.b=$},
k1(a,b,c,d){var s,r
switch(a){case 1:return new A.dN(b)
case 2:return new A.co(d==null?1:d,b)
case 3:return new A.co(d==null?16:d,b)
case 4:s=d==null?32:d
r=new A.dL(c,s,b)
r.eF(b,c,s)
return r
case 5:return new A.dM(c,d==null?16:d,b)
case 6:return new A.cm(d==null?32:d,b)
case 7:return new A.cm(d==null?32:d,b)
default:throw A.d(A.f("Invalid compression type: "+a))}},
aB:function aB(){},
dK:function dK(){},
mb(a,b,c,d){var s,r,q,p,o,n,m,l
if(b===0){if(d!==0)throw A.d(A.f("Incomplete huffman data"))
return}s=a.d
r=a.j()
q=a.j()
a.d+=4
p=a.j()
if(r<65537)o=q>=65537
else o=!0
if(o)throw A.d(A.f("Invalid huffman table size"))
a.d+=4
n=A.U(65537,0,!1,t.p)
m=J.a9(16384,t.gV)
for(l=0;l<16384;++l)m[l]=new A.dx()
A.mc(a,b-20,r,q,n)
if(p>8*(b-(a.d-s)))throw A.d(A.f("Error in header for Huffman-encoded data (invalid number of bits)."))
A.m8(n,r,q,m)
A.ma(n,m,a,p,q,d,c)},
ma(a,b,c,d,e,f,g){var s,r,q,p,o,n,m,l,k,j="Error in Huffman-encoded data (invalid code).",i=A.b([0,0],t.t),h=c.d+B.a.F(d+7,8)
for(s=b.length,r=0;c.d<h;){A.iV(i,c)
for(;q=i[1],q>=14;){p=B.a.X(i[0],q-14)&16383
if(!(p<s))return A.a(b,p)
o=b[p]
p=o.a
if(p!==0){B.b.h(i,1,q-p)
r=A.iW(o.b,e,i,c,g,r,f)}else{if(o.c==null)throw A.d(A.f(j))
for(n=0;n<o.b;++n){q=o.c
if(!(n<q.length))return A.a(q,n)
q=q[n]
if(!(q<65537))return A.a(a,q)
m=a[q]&63
while(!0){q=i[1]
if(!(q<m&&c.d<h))break
A.iV(i,c)}if(q>=m){p=o.c
if(!(n<p.length))return A.a(p,n)
p=p[n]
if(!(p<65537))return A.a(a,p)
q-=m
if(a[p]>>>6===(B.a.X(i[0],q)&B.a.A(1,m)-1)>>>0){B.b.h(i,1,q)
q=o.c
if(!(n<q.length))return A.a(q,n)
l=A.iW(q[n],e,i,c,g,r,f)
r=l
break}}}if(n===o.b)throw A.d(A.f(j))}}}k=8-d&7
B.b.h(i,0,B.a.i(i[0],k))
B.b.h(i,1,i[1]-k)
for(;q=i[1],q>0;){p=B.a.H(i[0],14-q)&16383
if(!(p<s))return A.a(b,p)
o=b[p]
p=o.a
if(p!==0){B.b.h(i,1,q-p)
r=A.iW(o.b,e,i,c,g,r,f)}else throw A.d(A.f(j))}if(r!==f)throw A.d(A.f("Error in Huffman-encoded data (decoded data are shorter than expected)."))},
iW(a,b,c,d,e,f,g){var s,r,q,p,o,n,m="Error in Huffman-encoded data (decoded data are longer than expected)."
if(a===b){if(c[1]<8)A.iV(c,d)
B.b.h(c,1,c[1]-8)
s=B.a.X(c[0],c[1])&255
if(f+s>g)throw A.d(A.f(m))
r=f-1
q=e.length
if(!(r>=0&&r<q))return A.a(e,r)
p=e[r]
for(;o=s-1,s>0;s=o,f=n){n=f+1
if(!(f<q))return A.a(e,f)
e[f]=p}}else{if(f<g){n=f+1
if(!(f<e.length))return A.a(e,f)
e[f]=a}else throw A.d(A.f(m))
f=n}return f},
m8(a,b,c,d){var s,r,q,p,o,n,m,l,k,j,i="Error in Huffman-encoded data (invalid code table entry)."
for(s=d.length,r=t.t,q=t.p;b<=c;++b){if(!(b<65537))return A.a(a,b)
p=a[b]
o=p>>>6
n=p&63
if(B.a.J(o,n)!==0)throw A.d(A.f(i))
if(n>14){p=B.a.Z(o,n-14)
if(!(p<s))return A.a(d,p)
m=d[p]
if(m.a!==0)throw A.d(A.f(i))
p=++m.b
l=m.c
if(l!=null){m.se_(A.U(p,0,!1,q))
for(k=0;k<m.b-1;++k){p=m.c
p.toString
if(!(k<l.length))return A.a(l,k)
B.b.h(p,k,l[k])}}else m.se_(A.b([0],r))
p=m.c
p.toString
B.b.h(p,m.b-1,b)}else if(n!==0){p=14-n
j=B.a.H(o,p)
if(!(j<s))return A.a(d,j)
for(k=B.a.H(1,p);k>0;--k,++j){if(!(j<s))return A.a(d,j)
m=d[j]
if(m.a!==0||m.c!=null)throw A.d(A.f(i))
m.a=n
m.b=b}}}},
mc(a,b,c,d,e){var s,r,q,p,o,n="Error in Huffman-encoded data (unexpected end of code table data).",m="Error in Huffman-encoded data (code table is longer than expected).",l=a.d,k=A.b([0,0],t.t)
for(s=d+1;c<=d;++c){if(a.d-l>b)throw A.d(A.f(n))
r=A.k2(6,k,a)
B.b.h(e,c,r)
if(r===63){if(a.d-l>b)throw A.d(A.f(n))
q=A.k2(8,k,a)+6
if(c+q>s)throw A.d(A.f(m))
for(;p=q-1,q!==0;q=p,c=o){o=c+1
B.b.h(e,c,0)}--c}else if(r>=59){q=r-59+2
if(c+q>s)throw A.d(A.f(m))
for(;p=q-1,q!==0;q=p,c=o){o=c+1
B.b.h(e,c,0)}--c}}A.m9(e)},
m9(a){var s,r,q,p,o,n=A.U(59,0,!1,t.p)
for(s=0;s<65537;++s){r=a[s]
if(!(r<59))return A.a(n,r)
B.b.h(n,r,n[r]+1)}for(q=0,s=58;s>0;--s,q=p){p=q+n[s]>>>1
B.b.h(n,s,q)}for(s=0;s<65537;++s){o=a[s]
if(o>0){if(!(o<59))return A.a(n,o)
r=n[o]
B.b.h(n,o,r+1)
B.b.h(a,s,(o|r<<6)>>>0)}}},
iV(a,b){B.b.h(a,0,((a[0]<<8|b.q())&-1)>>>0)
B.b.h(a,1,(a[1]+8&-1)>>>0)},
k2(a,b,c){var s,r,q
for(;s=b[1],s<a;){s=b[0]
r=c.a
q=c.d++
if(!(q>=0&&q<r.length))return A.a(r,q)
B.b.h(b,0,((s<<8|r[q])&-1)>>>0)
B.b.h(b,1,(b[1]+8&-1)>>>0)}B.b.h(b,1,s-a)
return(B.a.X(b[0],b[1])&B.a.A(1,a)-1)>>>0},
dx:function dx(){this.b=this.a=0
this.c=null},
md(a){var s=A.l(a,!1,null,0)
if(s.j()!==20000630)return!1
if(s.q()!==2)return!1
if((s.a9()&4294967289)>>>0!==0)return!1
return!0},
ff:function ff(a){var _=this
_.d=a
_.e=null
_.f=$
_.b=_.a=0},
k8(a,b){var s=new A.cn(new A.dB(A.H(t.dk,t.r)),A.b([],t.g9),A.H(t.N,t.aX),a)
s.eB(a,b,{})
return s},
dy:function dy(){},
fg:function fg(a,b){this.a=a
this.b=b},
cn:function cn(a,b,c,d){var _=this
_.a=a
_.b=b
_.c=c
_.e=$
_.r=_.f=null
_.Q=$
_.as=0
_.at=null
_.ax=$
_.CW=_.ch=_.ay=null
_.cx=d
_.go=_.fy=_.fx=_.fr=_.dy=_.dx=_.db=_.cy=null
_.id=$
_.k1=null},
dL:function dL(a,b,c){var _=this
_.r=null
_.w=a
_.x=b
_.y=$
_.z=null
_.b=_.a=0
_.c=c},
d3:function d3(){var _=this
_.f=_.e=_.d=_.c=_.b=_.a=$},
dM:function dM(a,b,c){var _=this
_.w=a
_.x=b
_.y=null
_.b=_.a=0
_.c=c},
dN:function dN(a){var _=this
_.r=null
_.b=_.a=0
_.c=a},
co:function co(a,b){var _=this
_.w=a
_.x=null
_.b=_.a=0
_.c=b},
fe:function fe(){this.a=null},
k3(a){var s=new Uint8Array(a*3)
A.mk(a)
return new A.fi(a,s)},
mk(a){var s
for(s=1;s<=8;++s)if(B.a.A(1,s)>=a)return s
return 0},
fi:function fi(a,b){this.b=a
this.c=null
this.d=b},
ck:function ck(){},
dO:function dO(){var _=this
_.e=_.d=_.c=_.b=_.a=$
_.f=null
_.x=$},
dA:function dA(a){var _=this
_.e=null
_.r=a
_.b=_.a=0},
fj:function fj(){var _=this
_.d=_.b=_.a=null
_.f=_.e=$
_.r=null
_.w=0
_.x=null
_.Q=_.z=_.y=0
_.as=null
_.cx=_.CW=_.ch=_.ay=_.ax=_.at=0},
k6(a){var s,r
if(a.k()!==0)return null
s=a.k()
if(!B.b.ah(A.b([1,2],t.t),s))return null
if(s===2)return null
r=a.k()
return new A.fo(r,A.ka(r,new A.fp(a),t.gx).cF(0))},
fn:function fn(){this.b=this.a=null},
fo:function fo(a,b){var _=this
_.e=a
_.f=b
_.b=_.a=0},
fp:function fp(a){this.a=a},
bN:function bN(a,b){this.d=a
this.e=b},
dD:function dD(a,b,c,d,e,f,g,h,i,j,k,l){var _=this
_.d=a
_.e=b
_.f=c
_.r=d
_.w=e
_.x=f
_.y=g
_.z=h
_.Q=i
_.as=j
_.at=k
_.ax=l
_.cy=_.cx=_.CW=_.ch=_.ay=null
_.b=_.a=0},
dr:function dr(a,b,c){this.e=a
this.f=b
this.r=c},
fu:function fu(){this.d=null},
am:function am(a,b,c,d){var _=this
_.a=a
_.b=b
_.c=c
_.d=d
_.y=_.x=_.w=_.r=_.f=_.e=$},
kg(){var s=t.fk
return new A.fv(new A.ce(A.H(t.p,t.z)),A.U(4,null,!1,t.aS),A.b([],t.f8),A.b([],s),A.b([],s),A.b([],t.eB))},
fv:function fv(a,b,c,d,e,f){var _=this
_.b=_.a=$
_.e=_.d=_.c=null
_.r=a
_.w=b
_.x=c
_.y=d
_.z=e
_.Q=f},
fw:function fw(a,b){this.a=a
this.b=b},
bZ:function bZ(a){this.a=a
this.b=0},
dV:function dV(a,b){var _=this
_.e=_.d=_.c=_.b=null
_.r=_.f=0
_.x=_.w=$
_.y=a
_.z=b},
fx:function fx(){this.r=this.f=$},
dW:function dW(a,b,c,d,e,f,g,h){var _=this
_.a=a
_.b=b
_.f=$
_.r=null
_.y=c
_.z=d
_.Q=e
_.as=f
_.at=g
_.ax=h
_.cx=_.CW=_.ch=_.ay=0
_.cy=$},
dU:function dU(){},
cC:function cC(){},
dP:function dP(a){this.c=this.b=null
this.y=a},
fM:function fM(){},
dQ:function dQ(a,b,c){var _=this
_.Q=_.z=_.y=_.x=_.w=_.r=_.e=_.d=null
_.at=""
_.ay=null
_.ch=a
_.cy=b
_.db=c
_.b=_.a=0},
ed:function ed(){var _=this
_.a=null
_.c=_.b=0
_.d=$
_.e=0},
fL:function fL(){},
ef:function ef(){this.a=null},
eg:function eg(){this.a=null},
au:function au(){},
ei:function ei(){this.a=null},
ej:function ej(){this.a=null},
el:function el(){this.a=null},
em:function em(){this.a=null},
cF:function cF(a){this.b=a},
ek:function ek(){},
fO:function fO(){var _=this
_.w=_.r=_.f=_.e=$},
br:function br(a){this.a=a
this.c=$},
ky(a){var s=new A.fQ(A.H(t.p,t.fh))
s.eH(a)
return s},
j9(a,b,c,d){var s=a/255,r=b/255,q=c/255,p=d/255,o=r*(1-q),n=s*(1-p)
return B.c.n(B.c.p((2*s<q?2*r*s+o+n:p*q-2*(q-s)*(p-r)+o+n)*255,0,255))},
fR(a,b){if(b===0)return 0
return B.c.n(B.a.p(B.c.n(255*(1-(1-a/255)/(b/255))),0,255))},
mG(a,b){return B.c.n(B.a.p(a+b-255,0,255))},
fS(a,b){if(b===255)return 255
return B.c.n(B.c.p(a/255/(1-b/255)*255,0,255))},
ja(a,b){var s=a/255,r=b/255,q=1-r
return B.c.ak(255*(q*r*s+r*(1-q*(1-s))))},
j7(a,b){var s=b/255,r=a/255
if(r<0.5)return B.c.ak(510*s*r)
else return B.c.ak(255*(1-2*(1-s)*(1-r)))},
jb(a,b){if(b<128)return A.fR(a,2*b)
else return A.fS(a,2*(b-128))},
j8(a,b){var s
if(b<128)return A.mG(a,2*b)
else{s=2*(b-128)
return s+a>255?255:a+s}},
kz(d1,d2,d3,d4,d5){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,c0,c1,c2,c3,c4,c5,c6,c7="data",c8=A.ak(d3,d4,B.i),c9=c8.aH(),d0=A.H(t.p,t.fW)
for(s=d5.length,r=0;q=d5.length,r<q;d5.length===s||(0,A.di)(d5),++r){p=d5[r]
d0.h(0,p.a,p)}if(d2===8)o=1
else o=d2===16?2:-1
if(o===-1)throw A.d(A.f("PSD: unsupported bit depth: "+A.r(d2)))
n=d0.m(0,0)
m=d0.m(0,1)
l=d0.m(0,2)
k=d0.m(0,-1)
for(s=c9.length,j=q>=5,i=o===1,h=q===4,g=q>=2,q=q>=4,f=0,e=0,d=0;f<d4;++f)for(c=0;c<d3;++c,d+=o)switch(d1){case 3:b=e+1
a=n.c
a===$&&A.c(c7)
a0=a.length
if(i){if(!(d>=0&&d<a0))return A.a(a,d)
a=a[d]}else{if(!(d>=0&&d<a0))return A.a(a,d)
a1=a[d]
a2=d+1
if(!(a2<a0))return A.a(a,a2)
a2=(a1<<8|a[a2])>>>8
a=a2}if(!(e>=0&&e<s))return A.a(c9,e)
c9[e]=a
a3=b+1
a=m.c
a===$&&A.c(c7)
a0=a.length
if(i){if(!(d>=0&&d<a0))return A.a(a,d)
a=a[d]}else{if(!(d>=0&&d<a0))return A.a(a,d)
a1=a[d]
a2=d+1
if(!(a2<a0))return A.a(a,a2)
a2=(a1<<8|a[a2])>>>8
a=a2}if(!(b>=0&&b<s))return A.a(c9,b)
c9[b]=a
a4=a3+1
a=l.c
a===$&&A.c(c7)
a0=a.length
if(i){if(!(d>=0&&d<a0))return A.a(a,d)
a=a[d]}else{if(!(d>=0&&d<a0))return A.a(a,d)
a1=a[d]
a2=d+1
if(!(a2<a0))return A.a(a,a2)
a2=(a1<<8|a[a2])>>>8
a=a2}if(!(a3>=0&&a3<s))return A.a(c9,a3)
c9[a3]=a
a3=a4+1
if(q){a=k.c
a===$&&A.c(c7)
a0=a.length
if(i){if(!(d>=0&&d<a0))return A.a(a,d)
a=a[d]}else{if(!(d>=0&&d<a0))return A.a(a,d)
a1=a[d]
a2=d+1
if(!(a2<a0))return A.a(a,a2)
a2=(a1<<8|a[a2])>>>8
a=a2}}else a=255
if(!(a4>=0&&a4<s))return A.a(c9,a4)
c9[a4]=a
a5=c9[e]
a6=c9[b]
a=e+2
if(!(a<s))return A.a(c9,a)
a7=c9[a]
a0=e+3
if(!(a0<s))return A.a(c9,a0)
a8=c9[a0]
if(a8!==0){c9[e]=B.a.O((a5+a8-255)*255,a8)
c9[b]=B.a.O((a6+a8-255)*255,a8)
c9[a]=B.a.O((a7+a8-255)*255,a8)}e=a3
break
case 9:a=n.c
a===$&&A.c(c7)
a0=a.length
if(i){if(!(d>=0&&d<a0))return A.a(a,d)
a=a[d]}else{if(!(d>=0&&d<a0))return A.a(a,d)
a1=a[d]
a2=d+1
if(!(a2<a0))return A.a(a,a2)
a2=(a1<<8|a[a2])>>>8
a=a2}a0=m.c
a0===$&&A.c(c7)
a1=a0.length
if(i){if(!(d>=0&&d<a1))return A.a(a0,d)
a0=a0[d]}else{if(!(d>=0&&d<a1))return A.a(a0,d)
a2=a0[d]
a9=d+1
if(!(a9<a1))return A.a(a0,a9)
a9=(a2<<8|a0[a9])>>>8
a0=a9}a1=l.c
a1===$&&A.c(c7)
a2=a1.length
if(i){if(!(d>=0&&d<a2))return A.a(a1,d)
a1=a1[d]}else{if(!(d>=0&&d<a2))return A.a(a1,d)
a9=a1[d]
b0=d+1
if(!(b0<a2))return A.a(a1,b0)
b0=(a9<<8|a1[b0])>>>8
a1=b0}if(q){a2=k.c
a2===$&&A.c(c7)
a9=a2.length
if(i){if(!(d>=0&&d<a9))return A.a(a2,d)
a2=a2[d]
b1=a2}else{if(!(d>=0&&d<a9))return A.a(a2,d)
b0=a2[d]
b2=d+1
if(!(b2<a9))return A.a(a2,b2)
b2=(b0<<8|a2[b2])>>>8
b1=b2}}else b1=255
b3=((a*100>>>8)+16)/116
b4=(a0-128)/500+b3
b5=b3-(a1-128)/200
b6=Math.pow(b3,3)
b3=b6>0.008856?b6:(b3-0.13793103448275862)/7.787
b7=Math.pow(b4,3)
b4=b7>0.008856?b7:(b4-0.13793103448275862)/7.787
b8=Math.pow(b5,3)
b5=b8>0.008856?b8:(b5-0.13793103448275862)/7.787
b4=b4*95.047/100
b3=b3*100/100
b5=b5*108.883/100
b9=b4*3.2406+b3*-1.5372+b5*-0.4986
c0=b4*-0.9689+b3*1.8758+b5*0.0415
c1=b4*0.0557+b3*-0.204+b5*1.057
b9=b9>0.0031308?1.055*Math.pow(b9,0.4166666666666667)-0.055:12.92*b9
c0=c0>0.0031308?1.055*Math.pow(c0,0.4166666666666667)-0.055:12.92*c0
c1=c1>0.0031308?1.055*Math.pow(c1,0.4166666666666667)-0.055:12.92*c1
c2=[B.c.n(B.c.p(b9*255,0,255)),B.c.n(B.c.p(c0*255,0,255)),B.c.n(B.c.p(c1*255,0,255))]
b=e+1
a=c2[0]
if(!(e>=0&&e<s))return A.a(c9,e)
c9[e]=a
e=b+1
a=c2[1]
if(!(b>=0&&b<s))return A.a(c9,b)
c9[b]=a
b=e+1
a=c2[2]
if(!(e>=0&&e<s))return A.a(c9,e)
c9[e]=a
e=b+1
if(!(b>=0&&b<s))return A.a(c9,b)
c9[b]=b1
break
case 1:a=n.c
a===$&&A.c(c7)
a0=a.length
if(i){if(!(d>=0&&d<a0))return A.a(a,d)
c3=a[d]}else{if(!(d>=0&&d<a0))return A.a(a,d)
a1=a[d]
a2=d+1
if(!(a2<a0))return A.a(a,a2)
c3=(a1<<8|a[a2])>>>8}if(g){a=k.c
a===$&&A.c(c7)
a0=a.length
if(i){if(!(d>=0&&d<a0))return A.a(a,d)
a=a[d]
b1=a}else{if(!(d>=0&&d<a0))return A.a(a,d)
a1=a[d]
a2=d+1
if(!(a2<a0))return A.a(a,a2)
a2=(a1<<8|a[a2])>>>8
b1=a2}}else b1=255
b=e+1
if(!(e>=0&&e<s))return A.a(c9,e)
c9[e]=c3
e=b+1
if(!(b>=0&&b<s))return A.a(c9,b)
c9[b]=c3
b=e+1
if(!(e>=0&&e<s))return A.a(c9,e)
c9[e]=c3
e=b+1
if(!(b>=0&&b<s))return A.a(c9,b)
c9[b]=b1
break
case 4:a=n.c
a===$&&A.c(c7)
a0=a.length
if(i){if(!(d>=0&&d<a0))return A.a(a,d)
c4=a[d]}else{if(!(d>=0&&d<a0))return A.a(a,d)
a1=a[d]
a2=d+1
if(!(a2<a0))return A.a(a,a2)
c4=(a1<<8|a[a2])>>>8}a=m.c
a===$&&A.c(c7)
a0=a.length
if(i){if(!(d>=0&&d<a0))return A.a(a,d)
c5=a[d]}else{if(!(d>=0&&d<a0))return A.a(a,d)
a1=a[d]
a2=d+1
if(!(a2<a0))return A.a(a,a2)
c5=(a1<<8|a[a2])>>>8}a=l.c
a===$&&A.c(c7)
a0=a.length
if(i){if(!(d>=0&&d<a0))return A.a(a,d)
b3=a[d]}else{if(!(d>=0&&d<a0))return A.a(a,d)
a1=a[d]
a2=d+1
if(!(a2<a0))return A.a(a,a2)
b3=(a1<<8|a[a2])>>>8}a=d0.m(0,h?-1:3).c
a===$&&A.c(c7)
a0=a.length
if(i){if(!(d>=0&&d<a0))return A.a(a,d)
c6=a[d]}else{if(!(d>=0&&d<a0))return A.a(a,d)
a1=a[d]
a2=d+1
if(!(a2<a0))return A.a(a,a2)
c6=(a1<<8|a[a2])>>>8}if(j){a=k.c
a===$&&A.c(c7)
a0=a.length
if(i){if(!(d>=0&&d<a0))return A.a(a,d)
a=a[d]
b1=a}else{if(!(d>=0&&d<a0))return A.a(a,d)
a1=a[d]
a2=d+1
if(!(a2<a0))return A.a(a,a2)
a2=(a1<<8|a[a2])>>>8
b1=a2}}else b1=255
a=1-(255-c6)/255
c2=[B.c.ak(255*(1-(255-c4)/255)*a),B.c.ak(255*(1-(255-c5)/255)*a),B.c.ak(255*(1-(255-b3)/255)*a)]
b=e+1
a=c2[0]
if(!(e>=0&&e<s))return A.a(c9,e)
c9[e]=a
e=b+1
a=c2[1]
if(!(b>=0&&b<s))return A.a(c9,b)
c9[b]=a
b=e+1
a=c2[2]
if(!(e>=0&&e<s))return A.a(c9,e)
c9[e]=a
e=b+1
if(!(b>=0&&b<s))return A.a(c9,b)
c9[b]=b1
break
default:throw A.d(A.f("Unhandled color mode: "+A.r(d1)))}return c8},
fQ:function fQ(a){var _=this
_.e=_.d=null
_.f=$
_.w=_.r=null
_.y=_.x=$
_.z=null
_.Q=a
_.ch=_.ay=_.ax=_.at=$
_.b=_.a=0},
eh:function eh(){},
cE:function cE(a,b,c){var _=this
_.b=_.a=null
_.f=_.e=_.d=_.c=$
_.r=null
_.as=_.y=_.w=$
_.ay=a
_.ch=b
_.cx=$
_.cy=c},
mH(a,b){var s
switch(a){case"lsct":s=b.c-b.d
b.j()
if(s>=12){if(b.L(4)!=="8BIM")A.D(A.f("Invalid key in layer additional data"))
b.L(4)}if(s>=16)b.j()
return new A.ek()
default:return new A.cF(b)}},
bP:function bP(){},
fP:function fP(){this.a=null},
h_:function h_(){var _=this
_.e=_.d=null
_.b=_.a=0},
fZ:function fZ(){this.a=null
this.b=$},
h9:function h9(a){this.a=a
this.c=this.b=0},
ew:function ew(a,b,c,d){var _=this
_.a=a
_.b=b
_.c=c
_.d=null
_.e=d},
jg(a,b,c){var s=new A.hb(b,a),r=t.B
s.scA(A.U(b,null,!1,r))
s.scu(A.U(b,null,!1,r))
return s},
hb:function hb(a,b){var _=this
_.a=a
_.c=b
_.d=0
_.f=_.e=null
_.r=$
_.x=_.w=null
_.y=0
_.z=2
_.as=0
_.at=null},
ex:function ex(a){var _=this
_.a=a
_.c=_.b=0
_.d=null
_.w=_.r=_.f=_.e=1
_.x=-1
_.y=!1
_.z=1
_.as=_.Q=$
_.ay=_.ax=0
_.CW=_.ch=null
_.cy=_.cx=$
_.dx=1
_.fr=_.dy=0
_.fy=null
_.k1=_.id=_.go=$
_.k3=_.k2=null},
hc:function hc(a){var _=this
_.e=null
_.r=a
_.b=_.a=0},
kl(){return new A.fC(new Uint8Array(4096))},
fC:function fC(a){var _=this
_.a=9
_.d=_.c=_.b=0
_.w=_.r=_.f=_.e=$
_.x=a
_.z=_.y=$
_.Q=null
_.as=$},
ha:function ha(){this.a=null
this.b=$},
jh(a,b){var s=new Int32Array(4),r=new Int32Array(4),q=new Int8Array(4),p=new Int8Array(4),o=A.U(8,null,!1,t.eW),n=A.U(4,null,!1,t.dP)
return new A.hi(a,b,new A.ho(),new A.hs(),new A.hk(s,r),new A.hu(q,p),o,n,new Uint8Array(4))},
kO(a,b,c){if(c===0)if(a===0)return b===0?6:5
else return b===0?4:0
return c},
hi:function hi(a,b,c,d,e,f,g,h,i){var _=this
_.a=a
_.b=b
_.c=$
_.d=null
_.e=$
_.f=c
_.r=d
_.w=e
_.x=f
_.z=_.y=$
_.ax=_.at=_.as=_.Q=null
_.ch=_.ay=$
_.cx=_.CW=null
_.cy=$
_.db=g
_.dy=h
_.fr=null
_.fy=_.fx=$
_.go=null
_.id=i
_.p3=_.p2=_.p1=_.ok=_.k4=_.k3=_.k2=_.k1=$
_.R8=_.p4=null
_.x2=_.x1=_.to=_.ry=_.rx=_.RG=$
_.xr=null
_.y2=_.y1=0
_.bj=$
_.aP=null
_.dT=_.cv=$
_.cw=null
_.cz=$},
hv:function hv(){},
kL(a){var s=new A.cL(a)
s.b=254
s.c=0
s.d=-8
return s},
cL:function cL(a){var _=this
_.a=a
_.d=_.c=_.b=$
_.e=!1},
t(a,b,c){return B.a.R(B.a.i(a+2*b+c+2,2),32)},
ne(a){var s,r,q,p,o,n,m=a.a,l=a.d,k=l+-33,j=m.length
if(!(k>=0&&k<j))return A.a(m,k)
k=m[k]
s=l+-32
if(!(s>=0&&s<j))return A.a(m,s)
s=m[s]
r=l+-31
if(!(r>=0&&r<j))return A.a(m,r)
r=m[r]
k=A.t(k,s,r)
q=l+-30
if(!(q>=0&&q<j))return A.a(m,q)
q=m[q]
s=A.t(s,r,q)
p=l+-29
if(!(p>=0&&p<j))return A.a(m,p)
p=m[p]
r=A.t(r,q,p)
l+=-28
if(!(l>=0&&l<j))return A.a(m,l)
o=A.b([k,s,r,A.t(q,p,m[l])],t.t)
for(n=0;n<4;++n)a.aF(n*32,4,o)},
n5(a){var s,r,q,p,o=a.a,n=a.d,m=n+-33,l=o.length
if(!(m>=0&&m<l))return A.a(o,m)
m=o[m]
s=n+-1
if(!(s>=0&&s<l))return A.a(o,s)
s=o[s]
r=n+31
if(!(r>=0&&r<l))return A.a(o,r)
r=o[r]
q=n+63
if(!(q>=0&&q<l))return A.a(o,q)
q=o[q]
n+=95
if(!(n>=0&&n<l))return A.a(o,n)
n=o[n]
p=A.i(a,null,0)
o=p.bs()
m=A.t(m,s,r)
if(0>=o.length)return A.a(o,0)
o[0]=16843009*m
p.d+=32
m=p.bs()
s=A.t(s,r,q)
if(0>=m.length)return A.a(m,0)
m[0]=16843009*s
p.d+=32
s=p.bs()
r=A.t(r,q,n)
if(0>=s.length)return A.a(s,0)
s[0]=16843009*r
p.d+=32
r=p.bs()
n=A.t(q,n,n)
if(0>=r.length)return A.a(r,0)
r[0]=16843009*n},
mZ(a){var s,r,q,p,o,n,m
for(s=a.a,r=a.d,q=s.length,p=4,o=0;o<4;++o){n=r+(o-32)
if(!(n>=0&&n<q))return A.a(s,n)
n=s[n]
m=r+(-1+o*32)
if(!(m>=0&&m<q))return A.a(s,m)
p+=n+s[m]}p=B.a.i(p,3)
for(o=0;o<4;++o){s=a.a
r=a.d+o*32
J.ax(s,r,r+4,p)}},
ji(a,b){var s,r,q,p,o,n,m,l=a.a,k=a.d+-33
if(!(k>=0&&k<l.length))return A.a(l,k)
s=255-l[k]
for(r=0,q=0;q<b;++q){l=a.a
k=a.d+(r-1)
if(!(k>=0&&k<l.length))return A.a(l,k)
p=s+l[k]
for(o=0;o<b;++o){l=$.a6()
k=a.a
n=a.d
m=n+(-32+o)
if(!(m>=0&&m<k.length))return A.a(k,m)
m=p+k[m]
l.toString
if(!(m>=0&&m<766))return A.a(l,m)
J.m(k,n+(r+o),l[m])}r+=32}},
nb(a){A.ji(a,4)},
nc(a){A.ji(a,8)},
na(a){A.ji(a,16)},
n9(a){var s,r,q,p,o,n,m,l=a.a,k=a.d,j=k+-1,i=l.length
if(!(j>=0&&j<i))return A.a(l,j)
j=l[j]
s=k+31
if(!(s>=0&&s<i))return A.a(l,s)
s=l[s]
r=k+63
if(!(r>=0&&r<i))return A.a(l,r)
r=l[r]
q=k+95
if(!(q>=0&&q<i))return A.a(l,q)
q=l[q]
p=k+-33
if(!(p>=0&&p<i))return A.a(l,p)
p=l[p]
o=k+-32
if(!(o>=0&&o<i))return A.a(l,o)
o=l[o]
n=k+-31
if(!(n>=0&&n<i))return A.a(l,n)
n=l[n]
m=k+-30
if(!(m>=0&&m<i))return A.a(l,m)
m=l[m]
k+=-29
if(!(k>=0&&k<i))return A.a(l,k)
k=l[k]
a.h(0,96,A.t(s,r,q))
r=A.t(j,s,r)
a.h(0,97,r)
a.h(0,64,r)
s=A.t(p,j,s)
a.h(0,98,s)
a.h(0,65,s)
a.h(0,32,s)
j=A.t(o,p,j)
a.h(0,99,j)
a.h(0,66,j)
a.h(0,33,j)
a.h(0,0,j)
p=A.t(n,o,p)
a.h(0,67,p)
a.h(0,34,p)
a.h(0,1,p)
o=A.t(m,n,o)
a.h(0,35,o)
a.h(0,2,o)
a.h(0,3,A.t(k,m,n))},
n8(a){var s,r,q,p,o,n,m=a.a,l=a.d,k=l+-32,j=m.length
if(!(k>=0&&k<j))return A.a(m,k)
k=m[k]
s=l+-31
if(!(s>=0&&s<j))return A.a(m,s)
s=m[s]
r=l+-30
if(!(r>=0&&r<j))return A.a(m,r)
r=m[r]
q=l+-29
if(!(q>=0&&q<j))return A.a(m,q)
q=m[q]
p=l+-28
if(!(p>=0&&p<j))return A.a(m,p)
p=m[p]
o=l+-27
if(!(o>=0&&o<j))return A.a(m,o)
o=m[o]
n=l+-26
if(!(n>=0&&n<j))return A.a(m,n)
n=m[n]
l+=-25
if(!(l>=0&&l<j))return A.a(m,l)
l=m[l]
a.h(0,0,A.t(k,s,r))
s=A.t(s,r,q)
a.h(0,32,s)
a.h(0,1,s)
r=A.t(r,q,p)
a.h(0,64,r)
a.h(0,33,r)
a.h(0,2,r)
q=A.t(q,p,o)
a.h(0,96,q)
a.h(0,65,q)
a.h(0,34,q)
a.h(0,3,q)
p=A.t(p,o,n)
a.h(0,97,p)
a.h(0,66,p)
a.h(0,35,p)
o=A.t(o,n,l)
a.h(0,98,o)
a.h(0,67,o)
a.h(0,99,A.t(n,l,l))},
nh(a){var s,r,q,p,o,n,m=a.a,l=a.d,k=l+-1,j=m.length
if(!(k>=0&&k<j))return A.a(m,k)
k=m[k]
s=l+31
if(!(s>=0&&s<j))return A.a(m,s)
s=m[s]
r=l+63
if(!(r>=0&&r<j))return A.a(m,r)
r=m[r]
q=l+-33
if(!(q>=0&&q<j))return A.a(m,q)
q=m[q]
p=l+-32
if(!(p>=0&&p<j))return A.a(m,p)
p=m[p]
o=l+-31
if(!(o>=0&&o<j))return A.a(m,o)
o=m[o]
n=l+-30
if(!(n>=0&&n<j))return A.a(m,n)
n=m[n]
l+=-29
if(!(l>=0&&l<j))return A.a(m,l)
l=m[l]
m=B.a.R(B.a.i(q+p+1,1),32)
a.h(0,65,m)
a.h(0,0,m)
m=B.a.R(B.a.i(p+o+1,1),32)
a.h(0,66,m)
a.h(0,1,m)
m=B.a.R(B.a.i(o+n+1,1),32)
a.h(0,67,m)
a.h(0,2,m)
a.h(0,3,B.a.R(B.a.i(n+l+1,1),32))
a.h(0,96,A.t(r,s,k))
a.h(0,64,A.t(s,k,q))
k=A.t(k,q,p)
a.h(0,97,k)
a.h(0,32,k)
q=A.t(q,p,o)
a.h(0,98,q)
a.h(0,33,q)
p=A.t(p,o,n)
a.h(0,99,p)
a.h(0,34,p)
a.h(0,35,A.t(o,n,l))},
ng(a){var s,r,q,p,o,n,m=a.a,l=a.d,k=l+-32,j=m.length
if(!(k>=0&&k<j))return A.a(m,k)
k=m[k]
s=l+-31
if(!(s>=0&&s<j))return A.a(m,s)
s=m[s]
r=l+-30
if(!(r>=0&&r<j))return A.a(m,r)
r=m[r]
q=l+-29
if(!(q>=0&&q<j))return A.a(m,q)
q=m[q]
p=l+-28
if(!(p>=0&&p<j))return A.a(m,p)
p=m[p]
o=l+-27
if(!(o>=0&&o<j))return A.a(m,o)
o=m[o]
n=l+-26
if(!(n>=0&&n<j))return A.a(m,n)
n=m[n]
l+=-25
if(!(l>=0&&l<j))return A.a(m,l)
l=m[l]
a.h(0,0,B.a.R(B.a.i(k+s+1,1),32))
m=B.a.R(B.a.i(s+r+1,1),32)
a.h(0,64,m)
a.h(0,1,m)
m=B.a.R(B.a.i(r+q+1,1),32)
a.h(0,65,m)
a.h(0,2,m)
m=B.a.R(B.a.i(q+p+1,1),32)
a.h(0,66,m)
a.h(0,3,m)
a.h(0,32,A.t(k,s,r))
s=A.t(s,r,q)
a.h(0,96,s)
a.h(0,33,s)
r=A.t(r,q,p)
a.h(0,97,r)
a.h(0,34,r)
q=A.t(q,p,o)
a.h(0,98,q)
a.h(0,35,q)
a.h(0,67,A.t(p,o,n))
a.h(0,99,A.t(o,n,l))},
n7(a){var s,r,q=a.a,p=a.d,o=p+-1,n=q.length
if(!(o>=0&&o<n))return A.a(q,o)
o=q[o]
s=p+31
if(!(s>=0&&s<n))return A.a(q,s)
s=q[s]
r=p+63
if(!(r>=0&&r<n))return A.a(q,r)
r=q[r]
p+=95
if(!(p>=0&&p<n))return A.a(q,p)
p=q[p]
a.h(0,0,B.a.R(B.a.i(o+s+1,1),32))
q=B.a.R(B.a.i(s+r+1,1),32)
a.h(0,32,q)
a.h(0,2,q)
q=B.a.R(B.a.i(r+p+1,1),32)
a.h(0,64,q)
a.h(0,34,q)
a.h(0,1,A.t(o,s,r))
s=A.t(s,r,p)
a.h(0,33,s)
a.h(0,3,s)
r=A.t(r,p,p)
a.h(0,65,r)
a.h(0,35,r)
a.h(0,99,p)
a.h(0,98,p)
a.h(0,97,p)
a.h(0,96,p)
a.h(0,66,p)
a.h(0,67,p)},
n3(a){var s,r,q,p,o,n,m=a.a,l=a.d,k=l+-1,j=m.length
if(!(k>=0&&k<j))return A.a(m,k)
k=m[k]
s=l+31
if(!(s>=0&&s<j))return A.a(m,s)
s=m[s]
r=l+63
if(!(r>=0&&r<j))return A.a(m,r)
r=m[r]
q=l+95
if(!(q>=0&&q<j))return A.a(m,q)
q=m[q]
p=l+-33
if(!(p>=0&&p<j))return A.a(m,p)
p=m[p]
o=l+-32
if(!(o>=0&&o<j))return A.a(m,o)
o=m[o]
n=l+-31
if(!(n>=0&&n<j))return A.a(m,n)
n=m[n]
l+=-30
if(!(l>=0&&l<j))return A.a(m,l)
l=m[l]
m=B.a.R(B.a.i(k+p+1,1),32)
a.h(0,34,m)
a.h(0,0,m)
m=B.a.R(B.a.i(s+k+1,1),32)
a.h(0,66,m)
a.h(0,32,m)
m=B.a.R(B.a.i(r+s+1,1),32)
a.h(0,98,m)
a.h(0,64,m)
a.h(0,96,B.a.R(B.a.i(q+r+1,1),32))
a.h(0,3,A.t(o,n,l))
a.h(0,2,A.t(p,o,n))
o=A.t(k,p,o)
a.h(0,35,o)
a.h(0,1,o)
p=A.t(s,k,p)
a.h(0,67,p)
a.h(0,33,p)
k=A.t(r,s,k)
a.h(0,99,k)
a.h(0,65,k)
a.h(0,97,A.t(q,r,s))},
nd(a){var s
for(s=0;s<16;++s)a.a8(s*32,16,a,-32)},
n4(a){var s,r,q,p,o
for(s=0,r=16;r>0;--r){q=a.a
p=a.d
o=p+(s-1)
if(!(o>=0&&o<q.length))return A.a(q,o)
p+=s
J.ax(q,p,p+16,q[o])
s+=32}},
hl(a,b){var s,r,q
for(s=0;s<16;++s){r=b.a
q=b.d+s*32
J.ax(r,q,q+16,a)}},
mV(a){var s,r,q,p,o,n,m
for(s=a.a,r=a.d,q=s.length,p=16,o=0;o<16;++o){n=r+(-1+o*32)
if(!(n>=0&&n<q))return A.a(s,n)
n=s[n]
m=r+(o-32)
if(!(m>=0&&m<q))return A.a(s,m)
p+=n+s[m]}A.hl(B.a.i(p,5),a)},
mX(a){var s,r,q,p,o,n
for(s=a.a,r=a.d,q=s.length,p=8,o=0;o<16;++o){n=r+(-1+o*32)
if(!(n>=0&&n<q))return A.a(s,n)
p+=s[n]}A.hl(B.a.i(p,4),a)},
mW(a){var s,r,q,p,o,n
for(s=a.a,r=a.d,q=s.length,p=8,o=0;o<16;++o){n=r+(o-32)
if(!(n>=0&&n<q))return A.a(s,n)
p+=s[n]}A.hl(B.a.i(p,4),a)},
mY(a){A.hl(128,a)},
nf(a){var s
for(s=0;s<8;++s)a.a8(s*32,8,a,-32)},
n6(a){var s,r,q,p,o
for(s=0,r=0;r<8;++r){q=a.a
p=a.d
o=p+(s-1)
if(!(o>=0&&o<q.length))return A.a(q,o)
p+=s
J.ax(q,p,p+8,q[o])
s+=32}},
hm(a,b){var s,r,q
for(s=0;s<8;++s){r=b.a
q=b.d+s*32
J.ax(r,q,q+8,a)}},
n_(a){var s,r,q,p,o,n,m
for(s=a.a,r=a.d,q=s.length,p=8,o=0;o<8;++o){n=r+(o-32)
if(!(n>=0&&n<q))return A.a(s,n)
n=s[n]
m=r+(-1+o*32)
if(!(m>=0&&m<q))return A.a(s,m)
p+=n+s[m]}A.hm(B.a.i(p,4),a)},
n0(a){var s,r,q,p,o,n
for(s=a.a,r=a.d,q=s.length,p=4,o=0;o<8;++o){n=r+(o-32)
if(!(n>=0&&n<q))return A.a(s,n)
p+=s[n]}A.hm(B.a.i(p,3),a)},
n1(a){var s,r,q,p,o,n
for(s=a.a,r=a.d,q=s.length,p=4,o=0;o<8;++o){n=r+(-1+o*32)
if(!(n>=0&&n<q))return A.a(s,n)
p+=s[n]}A.hm(B.a.i(p,3),a)},
n2(a){A.hm(128,a)},
b3(a,b,c,d,e){var s=b+c+d*32,r=a.a,q=a.d+s
if(!(q>=0&&q<r.length))return A.a(r,q)
q=r[q]+B.a.i(e,3)
if((q&-256)>>>0===0)r=q
else r=q<0?0:255
a.h(0,s,r)},
hn(a,b,c,d,e){A.b3(a,0,0,b,c+d)
A.b3(a,0,1,b,c+e)
A.b3(a,0,2,b,c-e)
A.b3(a,0,3,b,c-d)},
ni(){var s,r,q
if(!$.kM){for(s=-255;s<=255;++s){r=$.eY()
q=255+s
r[q]=s<0?-s:s
$.iQ()[q]=B.a.i(r[q],1)}for(s=-1020;s<=1020;++s){r=$.iR()
if(s<-128)q=-128
else q=s>127?127:s
r[1020+s]=q}for(s=-112;s<=112;++s){r=$.eZ()
if(s<-16)q=-16
else q=s>15?15:s
r[112+s]=q}for(s=-255;s<=510;++s){r=$.a6()
if(s<0)q=0
else q=s>255?255:s
r[255+s]=q}$.kM=!0}},
hj:function hj(){},
mU(){var s,r=J.a9(3,t.D)
for(s=0;s<3;++s)r[s]=new Uint8Array(11)
return new A.cK(r)},
nx(){var s,r,q,p,o=new Uint8Array(3),n=J.a9(4,t.c7)
for(s=t.bD,r=0;r<4;++r){q=J.a9(8,s)
for(p=0;p<8;++p)q[p]=A.mU()
n[r]=q}B.d.a6(o,0,3,255)
return new A.ht(o,n)},
ho:function ho(){this.d=$},
hs:function hs(){},
hu:function hu(a,b){var _=this
_.b=_.a=!1
_.c=!0
_.d=a
_.e=b},
cK:function cK(a){this.a=a},
ht:function ht(a,b){this.a=a
this.b=b},
hk:function hk(a,b){var _=this
_.a=$
_.b=null
_.d=_.c=$
_.e=a
_.f=b},
aK:function aK(){var _=this
_.b=_.a=0
_.c=!1
_.d=0},
cN:function cN(){this.b=this.a=0},
eG:function eG(a,b,c){this.a=a
this.b=b
this.c=c},
cO:function cO(a,b){var _=this
_.a=a
_.b=$
_.c=b
_.e=_.d=null
_.f=$},
cP:function cP(a,b,c){this.a=a
this.b=b
this.c=c},
jj(a,b){var s,r=A.b([],t.V),q=A.b([],t.i),p=new Uint32Array(2),o=new A.eE(a,p)
p=o.d=A.N(p.buffer,0,null)
s=a.q()
if(0>=p.length)return A.a(p,0)
p[0]=s
s=a.q()
if(1>=p.length)return A.a(p,1)
p[1]=s
s=a.q()
if(2>=p.length)return A.a(p,2)
p[2]=s
s=a.q()
if(3>=p.length)return A.a(p,3)
p[3]=s
s=a.q()
if(4>=p.length)return A.a(p,4)
p[4]=s
s=a.q()
if(5>=p.length)return A.a(p,5)
p[5]=s
s=a.q()
if(6>=p.length)return A.a(p,6)
p[6]=s
s=a.q()
if(7>=p.length)return A.a(p,7)
p[7]=s
return new A.cM(o,b,r,q)},
bv(a,b){return B.a.i(a+B.a.A(1,b)-1,b)},
cM:function cM(a,b,c,d){var _=this
_.b=a
_.c=b
_.d=null
_.r=_.f=_.e=0
_.w=null
_.z=_.y=_.x=0
_.Q=null
_.as=0
_.at=c
_.ax=d
_.ay=0
_.ch=null
_.CW=$
_.db=_.cy=_.cx=null},
dR:function dR(a,b,c,d){var _=this
_.b=a
_.c=b
_.d=null
_.r=_.f=_.e=0
_.w=null
_.z=_.y=_.x=0
_.Q=null
_.as=0
_.at=c
_.ax=d
_.ay=0
_.ch=null
_.CW=$
_.db=_.cy=_.cx=null},
eE:function eE(a,b){var _=this
_.a=0
_.b=a
_.c=b
_.d=$},
hp:function hp(a,b){this.a=a
this.b=b},
hq(a,b,c){var s
if(!(b>=0&&b<a.length))return A.a(a,b)
s=a[b]
a[b]=(((s&4278255360)>>>0)+((c&4278255360)>>>0)&4278255360|(s&16711935)+(c&16711935)&16711935)>>>0},
aL(a,b){return((a^b)>>>1&2139062143)+((a&b)>>>0)},
bu(a){if(a<0)return 0
if(a>255)return 255
return a},
hr(a,b,c){return Math.abs(b-c)-Math.abs(a-c)},
nj(a,b,c){return 4278190080},
nk(a,b,c){return b},
np(a,b,c){if(!(c>=0&&c<a.length))return A.a(a,c)
return a[c]},
nq(a,b,c){var s=c+1
if(!(s>=0&&s<a.length))return A.a(a,s)
return a[s]},
nr(a,b,c){var s=c-1
if(!(s>=0&&s<a.length))return A.a(a,s)
return a[s]},
ns(a,b,c){var s,r,q=a.length
if(!(c>=0&&c<q))return A.a(a,c)
s=a[c]
r=c+1
if(!(r<q))return A.a(a,r)
return A.aL(A.aL(b,a[r]),s)},
nt(a,b,c){var s=c-1
if(!(s>=0&&s<a.length))return A.a(a,s)
return A.aL(b,a[s])},
nu(a,b,c){if(!(c>=0&&c<a.length))return A.a(a,c)
return A.aL(b,a[c])},
nv(a,b,c){var s=c-1,r=a.length
if(!(s>=0&&s<r))return A.a(a,s)
s=a[s]
if(!(c>=0&&c<r))return A.a(a,c)
return A.aL(s,a[c])},
nw(a,b,c){var s,r,q=a.length
if(!(c>=0&&c<q))return A.a(a,c)
s=a[c]
r=c+1
if(!(r<q))return A.a(a,r)
return A.aL(s,a[r])},
nl(a,b,c){var s,r,q=c-1,p=a.length
if(!(q>=0&&q<p))return A.a(a,q)
q=a[q]
if(!(c>=0&&c<p))return A.a(a,c)
s=a[c]
r=c+1
if(!(r<p))return A.a(a,r)
r=a[r]
return A.aL(A.aL(b,q),A.aL(s,r))},
nm(a,b,c){var s,r,q=a.length
if(!(c>=0&&c<q))return A.a(a,c)
s=a[c]
r=c-1
if(!(r>=0&&r<q))return A.a(a,r)
r=a[r]
return A.hr(s>>>24,b>>>24,r>>>24)+A.hr(s>>>16&255,b>>>16&255,r>>>16&255)+A.hr(s>>>8&255,b>>>8&255,r>>>8&255)+A.hr(s&255,b&255,r&255)<=0?s:b},
nn(a,b,c){var s,r,q=a.length
if(!(c>=0&&c<q))return A.a(a,c)
s=a[c]
r=c-1
if(!(r>=0&&r<q))return A.a(a,r)
r=a[r]
return(A.bu((b>>>24)+(s>>>24)-(r>>>24))<<24|A.bu((b>>>16&255)+(s>>>16&255)-(r>>>16&255))<<16|A.bu((b>>>8&255)+(s>>>8&255)-(r>>>8&255))<<8|A.bu((b&255)+(s&255)-(r&255)))>>>0},
no(a,b,c){var s,r,q,p,o,n=a.length
if(!(c>=0&&c<n))return A.a(a,c)
s=a[c]
r=c-1
if(!(r>=0&&r<n))return A.a(a,r)
r=a[r]
q=A.aL(b,s)
s=q>>>24
n=q>>>16&255
p=q>>>8&255
o=q>>>0&255
return(A.bu(s+B.a.F(s-(r>>>24),2))<<24|A.bu(n+B.a.F(n-(r>>>16&255),2))<<16|A.bu(p+B.a.F(p-(r>>>8&255),2))<<8|A.bu(o+B.a.F(o-(r&255),2)))>>>0},
eF:function eF(){var _=this
_.c=_.b=_.a=0
_.d=null
_.e=0},
hw:function hw(a,b,c){var _=this
_.a=a
_.b=b
_.c=c
_.f=_.e=_.d=0
_.r=1
_.w=!1
_.x=$
_.y=!1},
cQ:function cQ(){},
dS:function dS(){this.r=1
this.x=this.w=$},
k5(){var s=new Uint8Array(128),r=new Int16Array(128)
s=new A.dC(s,r,new Int16Array(128))
s.cg(0)
return s},
ml(){var s,r=J.a9(5,t.bs)
for(s=0;s<5;++s)r[s]=A.k5()
return new A.bL(r)},
dC:function dC(a,b,c){var _=this
_.a=a
_.b=b
_.c=c
_.d=$
_.f=_.e=0},
bL:function bL(a){this.a=a},
cR:function cR(a){var _=this
_.e=_.d=!1
_.f=0
_.z=a
_.as=_.Q=0
_.at=null
_.b=_.a=_.ch=_.ay=0},
cp:function cp(a){var _=this
_.e=_.d=!1
_.f=0
_.z=a
_.as=_.Q=0
_.at=null
_.b=_.a=_.ch=_.ay=0},
hx:function hx(){this.b=this.a=null},
dB:function dB(a){var _=this
_.a=a
_.e=_.d=_.c=_.b=null},
k4(a,b,c){switch(b){case 1:if(c===8)return new Int8Array(a)
else if(c===16)return new Int16Array(a)
else if(c===32)return new Int32Array(a)
break
case 0:if(c===8)return new Uint8Array(a)
else if(c===16)return new Uint16Array(a)
else if(c===32)return new Uint32Array(a)
break
case 3:if(c===16)return new Uint16Array(a)
else if(c===32)return new Float32Array(a)
else if(c===64)return new Float64Array(a)
break}throw A.d(A.eA(null))},
fl(a,b,c,d,e){return new A.cl(a,b,c,d,e,A.k4(b*c,d,e))},
cl:function cl(a,b,c,d,e,f){var _=this
_.a=a
_.b=b
_.c=c
_.d=d
_.e=e
_.f=f},
oU(a1,a2){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b=new A.iF(new A.iG()),a=A.ak(a1.gea(a1),a1.gaD(a1),B.i),a0=a.aH()
if(!(a1.b!=null||a1.c!=null||a1.d!=null))throw A.d(A.f("Only RGB[A] images are currently supported."))
s=Math.pow(2,B.c.p(a2+2.47393,-20,20))
r=a0.length
q=a1.a
p=0
o=0
while(!0){if(q.a===0)n=0
else{n=q.gau()
n=n.b.$1(J.dj(n.a)).c}if(!(p<n))break
m=0
while(!0){if(q.a===0)n=0
else{n=q.gau()
n=n.b.$1(J.dj(n.a)).b}if(!(m<n))break
n=a1.b
if(n!=null)if(n.d===3){n=n.bv(m,p)
l=n}else{k=p*n.b+m
n=n.f
if(!(k>=0&&k<n.length))return A.a(n,k)
n=A.n(n[k])
l=n}else l=0
if(q.a===1)j=l
else{n=a1.c
if(n!=null){if(n.d===3)n=n.bv(m,p)
else{k=p*n.b+m
n=n.f
if(!(k>=0&&k<n.length))return A.a(n,k)
n=A.n(n[k])}j=n}else j=0}if(q.a===1)i=l
else{n=a1.d
if(n!=null){if(n.d===3)n=n.bv(m,p)
else{k=p*n.b+m
n=n.f
if(!(k>=0&&k<n.length))return A.a(n,k)
n=A.n(n[k])}i=n}else i=0}if(l==1/0||l==-1/0||isNaN(l))l=0
if(j==1/0||j==-1/0||isNaN(j))j=0
if(i==1/0||i==-1/0||isNaN(i))i=0
h=b.$2(l,s)
g=b.$2(j,s)
f=b.$2(i,s)
e=Math.max(h,Math.max(g,f))
if(e>255){h=255*(h/e)
g=255*(g/e)
f=255*(f/e)}d=o+1
n=B.c.n(B.c.p(h,0,255))
if(!(o>=0&&o<r))return A.a(a0,o)
a0[o]=n
o=d+1
n=B.c.n(B.c.p(g,0,255))
if(!(d>=0&&d<r))return A.a(a0,d)
a0[d]=n
d=o+1
n=B.c.n(B.c.p(f,0,255))
if(!(o>=0&&o<r))return A.a(a0,o)
a0[o]=n
n=a1.e
if(n!=null){c=n.bv(m,p)
if(c==1/0||c==-1/0||isNaN(c))c=1
o=d+1
n=B.c.n(B.c.p(c*255,0,255))
if(!(d>=0&&d<r))return A.a(a0,d)
a0[d]=n}else{o=d+1
if(!(d>=0&&d<r))return A.a(a0,d)
a0[d]=255}++m}++p}return a},
iG:function iG(){},
iF:function iF(a){this.a=a},
ak(a,b,c){var s=new Uint32Array(a*b),r=new A.ce(A.H(t.p,t.z))
r.ey(null)
return new A.dE(a,b,c,s,r)},
aC:function aC(a){this.b=a},
dn:function dn(a){this.b=a},
dE:function dE(a,b,c,d,e){var _=this
_.a=a
_.b=b
_.c=c
_.x=d
_.y=e
_.Q=null},
f(a){return new A.fq(a)},
fq:function fq(a){this.a=a},
l(a,b,c,d){return new A.Y(a,d,c==null?a.length:d+c,d,b)},
i(a,b,c){var s=a.a,r=a.d+c,q=a.b,p=b==null?a.c:r+b
return new A.Y(s,q,p,r,a.e)},
Y:function Y(a,b,c,d,e){var _=this
_.a=a
_.b=b
_.c=c
_.d=d
_.e=e},
fI(a){return new A.fH(new Uint8Array(a))},
fH:function fH(a){this.a=0
this.c=a},
oH(a,b){var s,r,q,p=t.cJ.a(self),o=new MessageChannel(),n=t.p,m=new A.hB(A.H(n,t.eg),new A.hy(new A.iz(o,p),A.H(n,t.w)))
n=o.port1
s=t.fQ
r=s.a(new A.iA(m))
t.Z.a(null)
q=t.e
A.hS(n,"message",r,!1,q)
A.hS(p,"message",s.a(new A.iB(m,o,a)),!1,q)},
iz:function iz(a,b){this.a=a
this.b=b},
iA:function iA(a){this.a=a},
iB:function iB(a,b,c){this.a=a
this.b=b
this.c=c},
hO:function hO(){},
eO:function eO(){this.a=null},
i8:function i8(a){this.a=a},
ey:function ey(){},
hd:function hd(a){this.a=a},
lY(a){var s,r
if(a==null)return null
s=J.J(a)
r=A.jt(s.m(a,1))
return new A.bG(A.n(s.m(a,0)),r)},
bG:function bG(a,b){var _=this
_.a=a
_.b=null
_.c=b
_.d=null},
je(){var s=$.Z
if(s==null){s=$.Z=new A.fU(A.b([],t.t))
s.d=$.aZ}return s},
eq(a){var s=$.Z
if(s==null)s=null
else{s=s.c
s=s==null?null:s.bd(800,a)}return s},
kE(a){var s=$.Z
if(s==null)s=null
else{s=s.c
s=s==null?null:s.bd(1000,a)}return s},
fU:function fU(a){var _=this
_.a=2000
_.b=a
_.c=null
_.d=!1
_.f=_.e=null},
aw(a){var s
A.kE("creating new SquadronError: "+a)
s=new A.cH(a)
s.eJ(a,null)
return s},
cH:function cH(a){this.a=a
this.b=null},
jd(a,b){var s,r,q=null
if(a instanceof A.cH)return a
else if(a instanceof A.bW){s=A.kP(a,q)
s.c=null
return A.kP(s,q)}else if(t.gY.b(a)){s=a.a
r=new A.eu(a.x,s,q,q,q)
r.bY(s,q,q,q)
return r}else return A.jk(J.bD(a),q,b,q)},
aY:function aY(){},
mN(a){if(a<1)return"ALL"
if(a<300)return"DEBUG"
if(a<400)return"FINEST"
if(a<500)return"FINER"
if(a<700)return"FINE"
if(a<800)return"CONFIG"
if(a<900)return"INFO"
if(a<1000)return"WARNING"
if(a<1200)return"SEVERE"
if(a<2000)return"SHOUT"
return"OFF"},
dl:function dl(){},
f2:function f2(){},
f3:function f3(){},
f4:function f4(){},
f5:function f5(){},
eb:function eb(a,b){this.b=a
this.a=b},
jk(a,b,c,d){var s=new A.bW(a,c,d,b)
s.bY(a,b,c,d)
return s},
lZ(a,b,c,d){var s=b==null?"The task has been cancelled":b,r=new A.bH(s,c,d,a)
r.bY(s,a,c,d)
return r},
kP(a,b){a.d=b
return a},
bW:function bW(a,b,c,d){var _=this
_.a=a
_.b=b
_.c=c
_.d=d},
bH:function bH(a,b,c,d){var _=this
_.a=a
_.b=b
_.c=c
_.d=d},
eu:function eu(a,b,c,d,e){var _=this
_.x=a
_.a=b
_.b=c
_.c=d
_.d=e},
kQ(a){var s,r,q,p,o,n,m,l,k,j,i
if(a==null)return null
s=a.m(0,"a")
r=A.n(a.m(0,"b"))
q=A.jt(a.m(0,"f"))
p=a.m(0,"c")
if(p==null)p=B.a9
t.j.a(p)
o=A.l4(a.m(0,"g"))
n=A.lY(t.bE.a(a.m(0,"d")))
m=A.l4(a.m(0,"e"))
l=a.m(0,"h")
l=A.js(l==null?!0:l)
if(s==null)s=null
else{k=new A.eO()
k.a=t.c4.a(s)
s=k}j=new A.aq(s,n,m,r,p,q,o,l)
i=a.m(0,"i")
if(i!=null)j.x=1000*Date.now()-A.n(i)
return j},
aq:function aq(a,b,c,d,e,f,g,h){var _=this
_.a=a
_.b=b
_.c=c
_.d=d
_.e=e
_.f=f
_.r=g
_.w=h
_.x=null},
hA(a){return new A.bw(!1,null,null,a)},
bw:function bw(a,b,c,d){var _=this
_.a=a
_.b=b
_.d=c
_.e=d},
aU:function aU(a,b,c){var _=this
_.e=a
_.f=0
_.a=b
_.b=null
_.c=c
_.d=null},
fT:function fT(){this.a=0},
hy:function hy(a,b){var _=this
_.a=a
_.b=!1
_.c=0
_.d=b
_.e=null
_.f=0},
hz:function hz(a){this.a=a},
hB:function hB(a,b){this.a=a
this.b=b},
hC:function hC(){},
hF:function hF(a,b,c){this.a=a
this.b=b
this.c=c},
hD:function hD(a,b){this.a=a
this.b=b},
hE:function hE(a,b,c){this.a=a
this.b=b
this.c=c},
mR(a){throw A.d(A.a_("Uint64List not supported on the web."))},
kJ(a,b){var s
A.bz(a,b,null)
s=B.a.F(a.byteLength-b,4)
return new Uint32Array(a,b,s)},
mg(a){var s
A.bz(a,0,null)
s=B.a.F(a.byteLength-0,4)
return new Float32Array(a,0,s)},
mh(a){return a.j7(0,0,null)},
lo(a){if(typeof dartPrint=="function"){dartPrint(a)
return}if(typeof console=="object"&&typeof console.log!="undefined"){console.log(a)
return}if(typeof window=="object")return
if(typeof print=="function"){print(a)
return}throw"Unable to print message: "+String(a)},
bC(a,b){var s,r,q=J.b9(a),p=q.gu(a)
b^=4294967295
for(s=0;p>=8;){r=s+1
b=B.k[(b^q.m(a,s))&255]^b>>>8
s=r+1
b=B.k[(b^q.m(a,r))&255]^b>>>8
r=s+1
b=B.k[(b^q.m(a,s))&255]^b>>>8
s=r+1
b=B.k[(b^q.m(a,r))&255]^b>>>8
r=s+1
b=B.k[(b^q.m(a,s))&255]^b>>>8
s=r+1
b=B.k[(b^q.m(a,r))&255]^b>>>8
r=s+1
b=B.k[(b^q.m(a,s))&255]^b>>>8
s=r+1
b=B.k[(b^q.m(a,r))&255]^b>>>8
p-=8}if(p>0)do{r=s+1
b=B.k[(b^q.m(a,s))&255]^b>>>8
if(--p,p>0){s=r
continue}else break}while(!0)
return(b^4294967295)>>>0},
aQ(a,b,c,d){return(B.c.n(B.a.p(d,0,255))<<24|B.c.n(B.a.p(c,0,255))<<16|B.c.n(B.a.p(b,0,255))<<8|B.c.n(B.a.p(a,0,255)))>>>0},
me(a6,a7,a8,a9,b0,b1,b2){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4=b2<16384,a5=a8>b0?b0:a8
for(s=1;s<=a5;)s=s<<1>>>0
s=s>>>1
r=s>>>1
q=A.b([0,0],t.t)
for(p=a6.length,o=s,s=r;s>=1;o=s,s=r){n=a7+b1*(b0-o)
m=b1*s
l=b1*o
k=a9*s
j=a9*o
for(i=(a8&s)>>>0!==0,h=a9*(a8-o),g=a7;g<=n;g+=l){f=g+h
for(e=g;e<=f;e+=j){d=e+k
c=e+m
b=c+k
if(a4){if(!(e>=0&&e<p))return A.a(a6,e)
a=a6[e]
if(!(c>=0&&c<p))return A.a(a6,c)
A.ch(a,a6[c],q)
a0=q[0]
a1=q[1]
if(!(d>=0&&d<p))return A.a(a6,d)
a=a6[d]
if(!(b>=0&&b<p))return A.a(a6,b)
A.ch(a,a6[b],q)
a2=q[0]
a3=q[1]
A.ch(a0,a2,q)
a6[e]=q[0]
a6[d]=q[1]
A.ch(a1,a3,q)
a6[c]=q[0]
a6[b]=q[1]}else{if(!(e>=0&&e<p))return A.a(a6,e)
a=a6[e]
if(!(c>=0&&c<p))return A.a(a6,c)
A.ci(a,a6[c],q)
a0=q[0]
a1=q[1]
if(!(d>=0&&d<p))return A.a(a6,d)
a=a6[d]
if(!(b>=0&&b<p))return A.a(a6,b)
A.ci(a,a6[b],q)
a2=q[0]
a3=q[1]
A.ci(a0,a2,q)
a6[e]=q[0]
a6[d]=q[1]
A.ci(a1,a3,q)
a6[c]=q[0]
a6[b]=q[1]}}if(i){c=e+m
if(a4){if(!(e>=0&&e<p))return A.a(a6,e)
a=a6[e]
if(!(c>=0&&c<p))return A.a(a6,c)
A.ch(a,a6[c],q)
a0=q[0]
a6[c]=q[1]}else{if(!(e>=0&&e<p))return A.a(a6,e)
a=a6[e]
if(!(c>=0&&c<p))return A.a(a6,c)
A.ci(a,a6[c],q)
a0=q[0]
a6[c]=q[1]}if(!(e>=0&&e<p))return A.a(a6,e)
a6[e]=a0}}if((b0&s)>>>0!==0){f=g+h
for(e=g;e<=f;e+=j){d=e+k
if(a4){if(!(e>=0&&e<p))return A.a(a6,e)
i=a6[e]
if(!(d>=0&&d<p))return A.a(a6,d)
A.ch(i,a6[d],q)
a0=q[0]
a6[d]=q[1]}else{if(!(e>=0&&e<p))return A.a(a6,e)
i=a6[e]
if(!(d>=0&&d<p))return A.a(a6,d)
A.ci(i,a6[d],q)
a0=q[0]
a6[d]=q[1]}if(!(e>=0&&e<p))return A.a(a6,e)
a6[e]=a0}}r=s>>>1}},
ch(a,b,c){var s,r,q,p,o,n=$.a2()
n[0]=a
s=$.a7()
r=s.length
if(0>=r)return A.a(s,0)
q=s[0]
n[0]=b
if(0>=r)return A.a(s,0)
p=s[0]
o=q+(p&1)+B.a.i(p,1)
B.b.h(c,0,o)
B.b.h(c,1,o-p)},
ci(a,b,c){var s=a-B.a.i(b,1)&65535
B.b.h(c,1,s)
B.b.h(c,0,b+s-32768&65535)},
oN(a){var s,r,q,p,o,n,m,l=null
t.L.a(a)
if(A.kg().j2(a))return new A.dU()
s=new A.ed()
if(s.b1(a))return s
r=new A.fj()
r.b=A.l(a,!1,l,0)
r.a=new A.dA(A.b([],t.U))
if(r.dc())return r
q=new A.hx()
if(q.b1(a))return q
p=new A.ha()
if(p.dA(A.l(a,!1,l,0))!=null)return p
if(A.ky(a).d===943870035)return new A.fP()
if(A.md(a))return new A.fe()
if(A.f7(A.l(a,!1,l,0)))return new A.dm()
o=new A.fZ()
if(o.b1(a))return o
n=new A.fn()
m=A.l(a,!1,l,0)
n.a=m
m=A.k6(m)
n.b=m
if(m!=null)return n
return l},
oL(a){var s=A.oN(a)
if(s==null)return null
return s.a5(a)},
p5(a4,a5,a6,a7){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3
if($.jy==null){s=$.jy=new Uint8Array(768)
for(r=-256;r<0;++r)s[256+r]=0
for(r=0;r<256;++r)s[256+r]=r
for(r=256;r<512;++r)s[256+r]=255}for(r=0;r<64;++r){s=a5[r]
q=a4[r]
if(!(r<64))return A.a(a7,r)
a7[r]=s*q}for(p=0,r=0;r<8;++r,p+=8){s=1+p
if(!(s<64))return A.a(a7,s)
q=a7[s]
if(q===0){o=2+p
if(!(o<64))return A.a(a7,o)
if(a7[o]===0){o=3+p
if(!(o<64))return A.a(a7,o)
if(a7[o]===0){o=4+p
if(!(o<64))return A.a(a7,o)
if(a7[o]===0){o=5+p
if(!(o<64))return A.a(a7,o)
if(a7[o]===0){o=6+p
if(!(o<64))return A.a(a7,o)
if(a7[o]===0){o=7+p
if(!(o<64))return A.a(a7,o)
o=a7[o]===0}else o=!1}else o=!1}else o=!1}else o=!1}else o=!1}else o=!1
if(o){if(!(p<64))return A.a(a7,p)
s=B.a.i(5793*a7[p]+512,10)
n=(s&2147483647)-((s&2147483648)>>>0)
if(!(p<64))return A.a(a7,p)
a7[p]=n
s=p+1
if(!(s<64))return A.a(a7,s)
a7[s]=n
s=p+2
if(!(s<64))return A.a(a7,s)
a7[s]=n
s=p+3
if(!(s<64))return A.a(a7,s)
a7[s]=n
s=p+4
if(!(s<64))return A.a(a7,s)
a7[s]=n
s=p+5
if(!(s<64))return A.a(a7,s)
a7[s]=n
s=p+6
if(!(s<64))return A.a(a7,s)
a7[s]=n
s=p+7
if(!(s<64))return A.a(a7,s)
a7[s]=n
continue}if(!(p<64))return A.a(a7,p)
o=B.a.i(5793*a7[p]+128,8)
m=(o&2147483647)-((o&2147483648)>>>0)
o=4+p
if(!(o<64))return A.a(a7,o)
l=B.a.i(5793*a7[o]+128,8)
k=(l&2147483647)-((l&2147483648)>>>0)
l=2+p
if(!(l<64))return A.a(a7,l)
j=a7[l]
i=6+p
if(!(i<64))return A.a(a7,i)
h=a7[i]
g=7+p
if(!(g<64))return A.a(a7,g)
f=a7[g]
e=B.a.i(2896*(q-f)+128,8)
d=(e&2147483647)-((e&2147483648)>>>0)
f=B.a.i(2896*(q+f)+128,8)
c=(f&2147483647)-((f&2147483648)>>>0)
f=3+p
if(!(f<64))return A.a(a7,f)
q=a7[f]<<4
b=(q&2147483647)-((q&2147483648)>>>0)
q=5+p
if(!(q<64))return A.a(a7,q)
e=a7[q]<<4
a=(e&2147483647)-((e&2147483648)>>>0)
e=B.a.i(m-k+1,1)
n=(e&2147483647)-((e&2147483648)>>>0)
e=B.a.i(m+k+1,1)
m=(e&2147483647)-((e&2147483648)>>>0)
e=B.a.i(j*3784+h*1567+128,8)
e=(e&2147483647)-((e&2147483648)>>>0)
a0=B.a.i(j*1567-h*3784+128,8)
j=(a0&2147483647)-((a0&2147483648)>>>0)
a0=B.a.i(d-a+1,1)
a0=(a0&2147483647)-((a0&2147483648)>>>0)
a1=B.a.i(d+a+1,1)
d=(a1&2147483647)-((a1&2147483648)>>>0)
a1=B.a.i(c+b+1,1)
a1=(a1&2147483647)-((a1&2147483648)>>>0)
a2=B.a.i(c-b+1,1)
b=(a2&2147483647)-((a2&2147483648)>>>0)
a2=B.a.i(m-e+1,1)
a2=(a2&2147483647)-((a2&2147483648)>>>0)
e=B.a.i(m+e+1,1)
m=(e&2147483647)-((e&2147483648)>>>0)
e=B.a.i(n-j+1,1)
e=(e&2147483647)-((e&2147483648)>>>0)
a3=B.a.i(n+j+1,1)
k=(a3&2147483647)-((a3&2147483648)>>>0)
a3=B.a.i(d*2276+a1*3406+2048,12)
n=(a3&2147483647)-((a3&2147483648)>>>0)
a1=B.a.i(d*3406-a1*2276+2048,12)
d=(a1&2147483647)-((a1&2147483648)>>>0)
a1=B.a.i(b*799+a0*4017+2048,12)
a1=(a1&2147483647)-((a1&2147483648)>>>0)
a0=B.a.i(b*4017-a0*799+2048,12)
b=(a0&2147483647)-((a0&2147483648)>>>0)
if(!(p<64))return A.a(a7,p)
a7[p]=m+n
if(!(g<64))return A.a(a7,g)
a7[g]=m-n
if(!(s<64))return A.a(a7,s)
a7[s]=k+a1
if(!(i<64))return A.a(a7,i)
a7[i]=k-a1
if(!(l<64))return A.a(a7,l)
a7[l]=e+b
if(!(q<64))return A.a(a7,q)
a7[q]=e-b
if(!(f<64))return A.a(a7,f)
a7[f]=a2+d
if(!(o<64))return A.a(a7,o)
a7[o]=a2-d}for(r=0;r<8;++r){s=8+r
q=a7[s]
if(q===0&&a7[16+r]===0&&a7[24+r]===0&&a7[32+r]===0&&a7[40+r]===0&&a7[48+r]===0&&a7[56+r]===0){q=B.a.i(5793*a7[r]+8192,14)
n=(q&2147483647)-((q&2147483648)>>>0)
if(!(r<64))return A.a(a7,r)
a7[r]=n
if(!(s<64))return A.a(a7,s)
a7[s]=n
s=16+r
if(!(s<64))return A.a(a7,s)
a7[s]=n
s=24+r
if(!(s<64))return A.a(a7,s)
a7[s]=n
s=32+r
if(!(s<64))return A.a(a7,s)
a7[s]=n
s=40+r
if(!(s<64))return A.a(a7,s)
a7[s]=n
s=48+r
if(!(s<64))return A.a(a7,s)
a7[s]=n
s=56+r
if(!(s<64))return A.a(a7,s)
a7[s]=n
continue}o=B.a.i(5793*a7[r]+2048,12)
m=(o&2147483647)-((o&2147483648)>>>0)
o=32+r
l=B.a.i(5793*a7[o]+2048,12)
k=(l&2147483647)-((l&2147483648)>>>0)
l=16+r
j=a7[l]
i=48+r
h=a7[i]
g=56+r
f=a7[g]
e=B.a.i(2896*(q-f)+2048,12)
d=(e&2147483647)-((e&2147483648)>>>0)
f=B.a.i(2896*(q+f)+2048,12)
c=(f&2147483647)-((f&2147483648)>>>0)
f=24+r
b=a7[f]
q=40+r
a=a7[q]
e=B.a.i(m-k+1,1)
n=(e&2147483647)-((e&2147483648)>>>0)
e=B.a.i(m+k+1,1)
m=(e&2147483647)-((e&2147483648)>>>0)
e=B.a.i(j*3784+h*1567+2048,12)
e=(e&2147483647)-((e&2147483648)>>>0)
a0=B.a.i(j*1567-h*3784+2048,12)
j=(a0&2147483647)-((a0&2147483648)>>>0)
a0=B.a.i(d-a+1,1)
a0=(a0&2147483647)-((a0&2147483648)>>>0)
a1=B.a.i(d+a+1,1)
d=(a1&2147483647)-((a1&2147483648)>>>0)
a1=B.a.i(c+b+1,1)
a1=(a1&2147483647)-((a1&2147483648)>>>0)
a2=B.a.i(c-b+1,1)
b=(a2&2147483647)-((a2&2147483648)>>>0)
a2=B.a.i(m-e+1,1)
a2=(a2&2147483647)-((a2&2147483648)>>>0)
e=B.a.i(m+e+1,1)
m=(e&2147483647)-((e&2147483648)>>>0)
e=B.a.i(n-j+1,1)
e=(e&2147483647)-((e&2147483648)>>>0)
a3=B.a.i(n+j+1,1)
k=(a3&2147483647)-((a3&2147483648)>>>0)
a3=B.a.i(d*2276+a1*3406+2048,12)
n=(a3&2147483647)-((a3&2147483648)>>>0)
a1=B.a.i(d*3406-a1*2276+2048,12)
d=(a1&2147483647)-((a1&2147483648)>>>0)
a1=B.a.i(b*799+a0*4017+2048,12)
a1=(a1&2147483647)-((a1&2147483648)>>>0)
a0=B.a.i(b*4017-a0*799+2048,12)
b=(a0&2147483647)-((a0&2147483648)>>>0)
if(!(r<64))return A.a(a7,r)
a7[r]=m+n
if(!(g<64))return A.a(a7,g)
a7[g]=m-n
a7[s]=k+a1
a7[i]=k-a1
a7[l]=e+b
a7[q]=e-b
a7[f]=a2+d
a7[o]=a2-d}for(s=$.jy,r=0;r<64;++r){s.toString
q=B.a.i(a7[r]+8,4)
q=384+((q&2147483647)-((q&2147483648)>>>0))
if(!(q>=0&&q<768))return A.a(s,q)
q=s[q]
if(!(r<64))return A.a(a6,r)
a6[r]=q}},
oO(f4){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,e0,e1,e2,e3,e4,e5,e6,e7,e8,e9,f0=f4.r.b,f1=f0.a2(274)?A.n(f0.m(0,274)):0,f2=f4.d,f3=f2.e
f3.toString
f2=f2.d
f2.toString
s=f1>=5&&f1<=8
if(s)r=f2
else r=f3
if(s)q=f3
else q=f2
p=A.ak(r,q,B.G)
p.y=new A.ce(A.H(t.p,t.z))
for(o=A.fB(f0,f0.r,A.y(f0).c);o.B();){n=o.d
if(n!==274)p.y.b.h(0,n,f0.m(0,n))}m=f2-1
l=f3-1
f0=f4.Q
f2=f0.length
switch(f2){case 1:if(0>=f2)return A.a(f0,0)
k=f0[0]
j=k.e
i=k.f
h=k.r
f0=p.x
f2=f0.length
f3=f1===8
o=f1===7
n=f1===6
g=f1===5
f=f1===4
e=f1===3
d=f1===2
c=p.a
b=j.length
a=0
a0=0
while(!0){a1=f4.d.d
a1.toString
if(!(a0<a1))break
a2=B.a.J(a0,h)
if(!(a2<b))return A.a(j,a2)
a3=j[a2]
a1=m-a0
a4=a1*c
a5=a0*c
a6=0
while(!0){a7=f4.d.e
a7.toString
if(!(a6<a7))break
a8=B.a.J(a6,i)
if(!(a8<a3.length))return A.a(a3,a8)
a9=a3[a8]
b0=(B.c.n(B.a.p(255,0,255))<<24|B.c.n(B.a.p(a9,0,255))<<16|B.c.n(B.a.p(a9,0,255))<<8|B.c.n(B.a.p(a9,0,255)))>>>0
if(d){a7=a5+(l-a6)
if(!(a7>=0&&a7<f2))return A.a(f0,a7)
f0[a7]=b0}else if(e){a7=a4+(l-a6)
if(!(a7>=0&&a7<f2))return A.a(f0,a7)
f0[a7]=b0}else if(f){a7=a4+a6
if(!(a7>=0&&a7<f2))return A.a(f0,a7)
f0[a7]=b0}else if(g){a7=a6*c+a0
if(!(a7>=0&&a7<f2))return A.a(f0,a7)
f0[a7]=b0}else if(n){a7=a6*c+a1
if(!(a7>=0&&a7<f2))return A.a(f0,a7)
f0[a7]=b0}else if(o){a7=(l-a6)*c+a1
if(!(a7>=0&&a7<f2))return A.a(f0,a7)
f0[a7]=b0}else if(f3){a7=(l-a6)*c+a0
if(!(a7>=0&&a7<f2))return A.a(f0,a7)
f0[a7]=b0}else{b1=a+1
if(!(a>=0&&a<f2))return A.a(f0,a)
f0[a]=b0
a=b1}++a6}++a0}break
case 3:if(0>=f2)return A.a(f0,0)
k=f0[0]
if(1>=f2)return A.a(f0,1)
b2=f0[1]
if(2>=f2)return A.a(f0,2)
b3=f0[2]
b4=k.e
b5=b2.e
b6=b3.e
i=k.f
h=k.r
b7=b2.f
b8=b2.r
b9=b3.f
c0=b3.r
f0=p.x
f2=f0.length
f3=f1===8
o=f1===7
n=f1===6
g=f1===5
f=f1===4
e=f1===3
d=f1===2
c=p.a
b=b4.length
a1=b5.length
a4=b6.length
a=0
a0=0
while(!0){a5=f4.d.d
a5.toString
if(!(a0<a5))break
a2=B.a.J(a0,h)
c1=B.a.J(a0,b8)
c2=B.a.J(a0,c0)
if(!(a2<b))return A.a(b4,a2)
a3=b4[a2]
if(!(c1<a1))return A.a(b5,c1)
c3=b5[c1]
if(!(c2<a4))return A.a(b6,c2)
c4=b6[c2]
a5=m-a0
a7=a5*c
c5=a0*c
a6=0
while(!0){c6=f4.d.e
c6.toString
if(!(a6<c6))break
a8=B.a.J(a6,i)
c7=B.a.J(a6,b7)
c8=B.a.J(a6,b9)
if(!(a8<a3.length))return A.a(a3,a8)
a9=a3[a8]<<8>>>0
if(!(c7<c3.length))return A.a(c3,c7)
c9=c3[c7]-128
if(!(c8<c4.length))return A.a(c4,c8)
d0=c4[c8]-128
c6=B.a.i(a9+359*d0+128,8)
c6=(c6&2147483647)-((c6&2147483648)>>>0)
if(c6<0)d1=0
else d1=c6>255?255:c6
c6=B.a.i(a9-88*c9-183*d0+128,8)
c6=(c6&2147483647)-((c6&2147483648)>>>0)
if(c6<0)d2=0
else d2=c6>255?255:c6
c6=B.a.i(a9+454*c9+128,8)
c6=(c6&2147483647)-((c6&2147483648)>>>0)
if(c6<0)d3=0
else d3=c6>255?255:c6
b0=(B.c.n(B.a.p(255,0,255))<<24|B.c.n(B.a.p(d3,0,255))<<16|B.c.n(B.a.p(d2,0,255))<<8|B.c.n(B.a.p(d1,0,255)))>>>0
if(d){c6=c5+(l-a6)
if(!(c6>=0&&c6<f2))return A.a(f0,c6)
f0[c6]=b0}else if(e){c6=a7+(l-a6)
if(!(c6>=0&&c6<f2))return A.a(f0,c6)
f0[c6]=b0}else if(f){c6=a7+a6
if(!(c6>=0&&c6<f2))return A.a(f0,c6)
f0[c6]=b0}else if(g){c6=a6*c+a0
if(!(c6>=0&&c6<f2))return A.a(f0,c6)
f0[c6]=b0}else if(n){c6=a6*c+a5
if(!(c6>=0&&c6<f2))return A.a(f0,c6)
f0[c6]=b0}else if(o){c6=(l-a6)*c+a5
if(!(c6>=0&&c6<f2))return A.a(f0,c6)
f0[c6]=b0}else if(f3){c6=(l-a6)*c+a0
if(!(c6>=0&&c6<f2))return A.a(f0,c6)
f0[c6]=b0}else{b1=a+1
if(!(a>=0&&a<f2))return A.a(f0,a)
f0[a]=b0
a=b1}++a6}++a0}break
case 4:f3=f4.c
if(f3==null)throw A.d(A.f("Unsupported color mode (4 components)"))
d4=f3.d!==0&&!0
if(0>=f2)return A.a(f0,0)
k=f0[0]
if(1>=f2)return A.a(f0,1)
b2=f0[1]
if(2>=f2)return A.a(f0,2)
b3=f0[2]
if(3>=f2)return A.a(f0,3)
d5=f0[3]
b4=k.e
b5=b2.e
b6=b3.e
d6=d5.e
i=k.f
h=k.r
b7=b2.f
b8=b2.r
b9=b3.f
c0=b3.r
d7=d5.f
d8=d5.r
f0=p.x
f2=f0.length
f3=f1===8
o=f1===7
n=f1===6
g=f1===5
f=f1===4
e=f1===3
d=f1===2
c=!d4
b=p.a
a1=b4.length
a4=b5.length
a5=b6.length
a7=d6.length
a=0
a0=0
while(!0){c5=f4.d.d
c5.toString
if(!(a0<c5))break
a2=B.a.J(a0,h)
c1=B.a.J(a0,b8)
c2=B.a.J(a0,c0)
d9=B.a.J(a0,d8)
if(!(a2<a1))return A.a(b4,a2)
a3=b4[a2]
if(!(c1<a4))return A.a(b5,c1)
c3=b5[c1]
if(!(c2<a5))return A.a(b6,c2)
c4=b6[c2]
if(!(d9<a7))return A.a(d6,d9)
e0=d6[d9]
c5=m-a0
c6=c5*b
e1=a0*b
a6=0
while(!0){e2=f4.d.e
e2.toString
if(!(a6<e2))break
a8=B.a.J(a6,i)
c7=B.a.J(a6,b7)
c8=B.a.J(a6,b9)
e3=B.a.J(a6,d7)
if(c){if(!(a8<a3.length))return A.a(a3,a8)
e4=a3[a8]
if(!(c7<c3.length))return A.a(c3,c7)
e5=c3[c7]
if(!(c8<c4.length))return A.a(c4,c8)
e6=c4[c8]
if(!(e3<e0.length))return A.a(e0,e3)
e7=e0[e3]}else{if(!(a8<a3.length))return A.a(a3,a8)
a9=a3[a8]
if(!(c7<c3.length))return A.a(c3,c7)
c9=c3[c7]
if(!(c8<c4.length))return A.a(c4,c8)
d0=c4[c8]
if(!(e3<e0.length))return A.a(e0,e3)
e7=e0[e3]
e2=d0-128
e8=B.c.n(a9+1.402*e2)
if(e8<0)e8=0
else if(e8>255)e8=255
e4=255-e8
e8=c9-128
e2=B.c.n(a9-0.3441363*e8-0.71413636*e2)
if(e2<0)e2=0
else if(e2>255)e2=255
e5=255-e2
e8=B.c.n(a9+1.772*e8)
if(e8<0)e2=0
else e2=e8>255?255:e8
e6=255-e2}e2=B.a.i(e4*e7,8)
e8=B.a.i(e5*e7,8)
e9=B.a.i(e6*e7,8)
b0=(B.c.n(B.a.p(255,0,255))<<24|B.c.n(B.a.p((e9&2147483647)-((e9&2147483648)>>>0),0,255))<<16|B.c.n(B.a.p((e8&2147483647)-((e8&2147483648)>>>0),0,255))<<8|B.c.n(B.a.p((e2&2147483647)-((e2&2147483648)>>>0),0,255)))>>>0
if(d){e2=e1+(l-a6)
if(!(e2>=0&&e2<f2))return A.a(f0,e2)
f0[e2]=b0}else if(e){e2=c6+(l-a6)
if(!(e2>=0&&e2<f2))return A.a(f0,e2)
f0[e2]=b0}else if(f){e2=c6+a6
if(!(e2>=0&&e2<f2))return A.a(f0,e2)
f0[e2]=b0}else if(g){e2=a6*b+a0
if(!(e2>=0&&e2<f2))return A.a(f0,e2)
f0[e2]=b0}else if(n){e2=a6*b+c5
if(!(e2>=0&&e2<f2))return A.a(f0,e2)
f0[e2]=b0}else if(o){e2=(l-a6)*b+c5
if(!(e2>=0&&e2<f2))return A.a(f0,e2)
f0[e2]=b0}else if(f3){e2=(l-a6)*b+a0
if(!(e2>=0&&e2<f2))return A.a(f0,e2)
f0[e2]=b0}else{b1=a+1
if(!(a>=0&&a<f2))return A.a(f0,a)
f0[a]=b0
a=b1}++a6}++a0}break
default:throw A.d(A.f("Unsupported color mode"))}return p},
nC(a,b,c,d,e,f){A.nz(f,a,b,c,d,e,!0,f)},
nD(a,b,c,d,e,f){A.nA(f,a,b,c,d,e,!0,f)},
nB(a,b,c,d,e,f){A.ny(f,a,b,c,d,e,!0,f)},
bV(a,b,c,d,e){var s,r,q,p
for(s=0;s<d;++s){r=a.a
q=a.d+s
if(!(q>=0&&q<r.length))return A.a(r,q)
q=r[q]
r=b.a
p=b.d+s
if(!(p>=0&&p<r.length))return A.a(r,p)
p=r[p]
J.m(c.a,c.d+s,q+p)}},
nz(a,b,c,d,e,f,g,h){var s,r,q=null,p=e*d,o=e+f,n=A.l(a,!1,q,p),m=A.l(a,!1,q,p),l=A.i(m,q,0)
if(e===0){s=n.a
r=n.d
if(!(r>=0&&r<s.length))return A.a(s,r)
m.h(0,0,s[r])
A.bV(A.i(n,q,1),l,A.i(m,q,1),b-1,!0)
l.d+=d
n.d+=d
m.d+=d
e=1}for(s=-d,r=b-1;e<o;){A.bV(n,A.i(l,q,s),m,1,!0)
A.bV(A.i(n,q,1),l,A.i(m,q,1),r,!0);++e
l.d+=d
n.d+=d
m.d+=d}},
nA(a,b,c,d,e,f,g,h){var s,r,q=null,p=e*d,o=e+f,n=A.l(a,!1,q,p),m=A.l(h,!1,q,p),l=A.i(m,q,0)
if(e===0){s=n.a
r=n.d
if(!(r>=0&&r<s.length))return A.a(s,r)
m.h(0,0,s[r])
A.bV(A.i(n,q,1),l,A.i(m,q,1),b-1,!0)
n.d+=d
m.d+=d
e=1}else l.d-=d
for(;e<o;){A.bV(n,l,m,b,!0);++e
l.d+=d
n.d+=d
m.d+=d}},
ny(a,b,c,a0,a1,a2,a3,a4){var s,r,q,p,o,n,m,l,k,j,i=null,h=a1*a0,g=a1+a2,f=A.l(a,!1,i,h),e=A.l(a4,!1,i,h),d=A.i(e,i,0)
if(a1===0){s=f.a
r=f.d
if(!(r>=0&&r<s.length))return A.a(s,r)
e.h(0,0,s[r])
A.bV(A.i(f,i,1),d,A.i(e,i,1),b-1,!0)
d.d+=a0
f.d+=a0
e.d+=a0
a1=1}for(s=-a0;a1<g;){A.bV(f,A.i(d,i,s),e,1,!0)
for(q=1;q<b;++q){r=d.a
p=d.d
o=p+(q-1)
n=r.length
if(!(o>=0&&o<n))return A.a(r,o)
o=r[o]
m=q-a0
l=p+m
if(!(l>=0&&l<n))return A.a(r,l)
l=r[l]
m=p+(m-1)
if(!(m>=0&&m<n))return A.a(r,m)
k=o+l-r[m]
if((k&4294967040)>>>0===0)j=k
else j=k<0?0:255
r=f.a
p=f.d+q
if(!(p>=0&&p<r.length))return A.a(r,p)
p=r[p]
J.m(e.a,e.d+q,p+j)}++a1
d.d+=a0
f.d+=a0
e.d+=a0}},
mm(a){var s,r,q,p
if($.L==null)A.aD()
$.jL()[0]=a
s=$.lJ()
if(0>=s.length)return A.a(s,0)
r=s[0]
if(a===0)return r>>>16
q=r>>>23&511
s=$.fk.hs()
if(!(q<s.length))return A.a(s,q)
q=s[q]
if(q!==0){p=r&8388607
return q+(p+4095+(p>>>13&1)>>>13)}return A.mn(r)},
mn(a){var s,r,q=a>>>16&32768,p=(a>>>23&255)-112,o=a&8388607
if(p<=0){if(p<-10)return q
o|=8388608
s=14-p
return(q|B.a.X(o+(B.a.H(1,s-1)-1)+(B.a.Z(o,s)&1),s))>>>0}else if(p===143)if(o===0)return q|31744
else{o=o>>>13
r=o===0?1:0
return q|o|r|31744}else{o=o+4095+(o>>>13&1)
if((o&8388608)!==0){++p
o=0}if(p>30)return q|31744
return(q|p<<10|o>>>13)>>>0}},
aD(){var s,r,q,p,o
if($.iY!=null)return
s=new Uint32Array(65536)
$.iY=s
$.L=A.my(s.buffer,0,null)
s=new Uint16Array(512)
$.fk.b=s
for(r=0;r<256;++r){q=(r&255)-112
if(q<=0||q>=30){$.fk.toString
s[r]=0
p=(r|256)>>>0
if(!(p<512))return A.a(s,p)
s[p]=0}else{$.fk.toString
p=q<<10>>>0
s[r]=p
o=(r|256)>>>0
if(!(o<512))return A.a(s,o)
s[o]=(p|32768)>>>0}}for(s=$.iY,r=0;r<65536;++r){s.toString
s[r]=A.mo(r)}},
mo(a){var s,r=a>>>15&1,q=a>>>10&31,p=a&1023
if(q===0)if(p===0)return r<<31>>>0
else{for(;(p&1024)===0;){p=p<<1;--q}++q
p&=4294966271}else if(q===31){s=r<<31
if(p===0)return(s|2139095040)>>>0
else return(s|p<<13|2139095040)>>>0}return(r<<31|q+112<<23|p<<13)>>>0},
pa(a){$.jN().h(0,0,a)
return $.lL().m(0,0)},
iC(a){var s,r
if(a==null)return"null"
for(s=32,r="";s>-1;--s)r+=(a&B.a.H(1,s))>>>0===0?"0":"1"
return r.charCodeAt(0)==0?r:r},
lq(a){var s,r,q,p,o
try{if(a!=null)a.$0()}catch(r){s=A.a1(r)
q=A.r(a)
p=A.r(s)
o=$.Z
if(o!=null){o=o.c
if(o!=null)o.bd(900,"callback "+q+" failed: "+p)}}}},J={
jG(a,b,c,d){return{i:a,p:b,e:c,x:d}},
iE(a){var s,r,q,p,o,n=a[v.dispatchPropertyName]
if(n==null)if($.jF==null){A.oW()
n=a[v.dispatchPropertyName]}if(n!=null){s=n.p
if(!1===s)return n.i
if(!0===s)return a
r=Object.getPrototypeOf(a)
if(s===r)return n.i
if(n.e===r)throw A.d(A.eA("Return interceptor for "+A.r(s(a,n))))}q=a.constructor
if(q==null)p=null
else{o=$.i7
if(o==null)o=$.i7=v.getIsolateTag("_$dart_js")
p=q[o]}if(p!=null)return p
p=A.p1(a)
if(p!=null)return p
if(typeof a=="function")return B.aF
s=Object.getPrototypeOf(a)
if(s==null)return B.ao
if(s===Object.prototype)return B.ao
if(typeof q=="function"){o=$.i7
if(o==null)o=$.i7=v.getIsolateTag("_$dart_js")
Object.defineProperty(q,o,{value:B.O,enumerable:false,writable:true,configurable:true})
return B.O}return B.O},
j0(a,b){if(a<0||a>4294967295)throw A.d(A.O(a,0,4294967295,"length",null))
return J.kc(new Array(a),b)},
a9(a,b){if(a<0||a>4294967295)throw A.d(A.O(a,0,4294967295,"length",null))
return J.kc(new Array(a),b)},
kb(a,b){if(a<0)throw A.d(A.bE("Length must be a non-negative integer: "+a,null))
return A.b(new Array(a),b.l("o<0>"))},
kc(a,b){return J.kd(A.b(a,b.l("o<0>")),b)},
kd(a,b){a.fixed$length=Array
return a},
kf(a){if(a<256)switch(a){case 9:case 10:case 11:case 12:case 13:case 32:case 133:case 160:return!0
default:return!1}switch(a){case 5760:case 8192:case 8193:case 8194:case 8195:case 8196:case 8197:case 8198:case 8199:case 8200:case 8201:case 8202:case 8232:case 8233:case 8239:case 8287:case 12288:case 65279:return!0
default:return!1}},
mr(a,b){var s,r
for(s=a.length;b<s;){r=B.e.aU(a,b)
if(r!==32&&r!==13&&!J.kf(r))break;++b}return b},
ms(a,b){var s,r
for(;b>0;b=s){s=b-1
r=B.e.bg(a,s)
if(r!==32&&r!==13&&!J.kf(r))break}return b},
c5(a){if(typeof a=="number"){if(Math.floor(a)==a)return J.cs.prototype
return J.dT.prototype}if(typeof a=="string")return J.bm.prototype
if(a==null)return J.ct.prototype
if(typeof a=="boolean")return J.cr.prototype
if(a.constructor==Array)return J.o.prototype
if(typeof a!="object"){if(typeof a=="function")return J.aE.prototype
return a}if(a instanceof A.q)return a
return J.iE(a)},
b9(a){if(typeof a=="string")return J.bm.prototype
if(a==null)return a
if(a.constructor==Array)return J.o.prototype
if(typeof a!="object"){if(typeof a=="function")return J.aE.prototype
return a}if(a instanceof A.q)return a
return J.iE(a)},
J(a){if(a==null)return a
if(a.constructor==Array)return J.o.prototype
if(typeof a!="object"){if(typeof a=="function")return J.aE.prototype
return a}if(a instanceof A.q)return a
return J.iE(a)},
oP(a){if(typeof a=="number")return J.bl.prototype
if(a==null)return a
if(typeof a=="boolean")return J.cr.prototype
if(!(a instanceof A.q))return J.b2.prototype
return a},
oQ(a){if(typeof a=="number")return J.bl.prototype
if(typeof a=="string")return J.bm.prototype
if(a==null)return a
if(!(a instanceof A.q))return J.b2.prototype
return a},
lj(a){if(a==null)return a
if(typeof a!="object"){if(typeof a=="function")return J.aE.prototype
return a}if(a instanceof A.q)return a
return J.iE(a)},
oR(a){if(a==null)return a
if(!(a instanceof A.q))return J.b2.prototype
return a},
lN(a,b){if(typeof a=="number"&&typeof b=="number")return(a&b)>>>0
return J.oP(a).M(a,b)},
aj(a,b){if(a==null)return b==null
if(typeof a!="object")return b!=null&&a===b
return J.c5(a).b5(a,b)},
lO(a,b){if(typeof b==="number")if(a.constructor==Array||A.p_(a,a[v.dispatchPropertyName]))if(b>>>0===b&&b<a.length)return a[b]
return J.J(a).m(a,b)},
m(a,b,c){return J.J(a).h(a,b,c)},
lP(a,b,c,d){return J.lj(a).hK(a,b,c,d)},
lQ(a,b,c,d){return J.lj(a).cp(a,b,c,d)},
lR(a,b){return J.oQ(a).bP(a,b)},
jP(a,b){return J.J(a).ac(a,b)},
jQ(a,b){return J.oR(a).ig(a,b)},
lS(a,b){return J.J(a).aO(a,b)},
ax(a,b,c,d){return J.J(a).a6(a,b,c,d)},
dj(a){return J.J(a).gai(a)},
dk(a){return J.c5(a).ga3(a)},
as(a){return J.J(a).gU(a)},
aS(a){return J.b9(a).gu(a)},
lT(a,b,c){return J.J(a).aQ(a,b,c)},
jR(a,b){return J.J(a).cM(a,b)},
iS(a,b,c){return J.J(a).a0(a,b,c)},
bD(a){return J.c5(a).t(a)},
lU(a,b){return J.J(a).aR(a,b)},
dJ:function dJ(){},
cr:function cr(){},
ct:function ct(){},
al:function al(){},
aV:function aV(){},
ec:function ec(){},
b2:function b2(){},
aE:function aE(){},
o:function o(a){this.$ti=a},
ft:function ft(a){this.$ti=a},
c6:function c6(a,b,c){var _=this
_.a=a
_.b=b
_.c=0
_.d=null
_.$ti=c},
bl:function bl(){},
cs:function cs(){},
dT:function dT(){},
bm:function bm(){}},B={}
var w=[A,J,B]
var $={}
A.j1.prototype={}
J.dJ.prototype={
b5(a,b){return a===b},
ga3(a){return A.cD(a)},
t(a){return"Instance of '"+A.fN(a)+"'"}}
J.cr.prototype={
t(a){return String(a)},
M(a,b){return A.oI(A.js(b))&&a},
ga3(a){return a?519018:218159},
$iB:1}
J.ct.prototype={
b5(a,b){return null==b},
t(a){return"null"},
ga3(a){return 0},
$iF:1}
J.al.prototype={}
J.aV.prototype={
ga3(a){return 0},
t(a){return String(a)},
$ike:1}
J.ec.prototype={}
J.b2.prototype={}
J.aE.prototype={
t(a){var s=a[$.lu()]
if(s==null)return this.ex(a)
return"JavaScript function for "+J.bD(s)},
$ibj:1}
J.o.prototype={
v(a,b){A.a4(a).c.a(b)
if(!!a.fixed$length)A.D(A.a_("add"))
a.push(b)},
bq(a,b){var s
if(!!a.fixed$length)A.D(A.a_("remove"))
for(s=0;s<a.length;++s)if(J.aj(a[s],b)){a.splice(s,1)
return!0}return!1},
aR(a,b){var s=A.a4(a)
return new A.S(a,s.l("B(1)").a(b),s.l("S<1>"))},
an(a,b){var s
A.a4(a).l("k<1>").a(b)
if(!!a.fixed$length)A.D(A.a_("addAll"))
if(Array.isArray(b)){this.f0(a,b)
return}for(s=J.as(b);s.B();)a.push(s.gE())},
f0(a,b){var s,r
t.b.a(b)
s=b.length
if(s===0)return
if(a===b)throw A.d(A.ay(a))
for(r=0;r<s;++r)a.push(b[r])},
aQ(a,b,c){var s=A.a4(a)
return new A.aG(a,s.D(c).l("1(2)").a(b),s.l("@<1>").D(c).l("aG<1,2>"))},
cM(a,b){return A.jf(a,b,null,A.a4(a).c)},
ac(a,b){if(!(b>=0&&b<a.length))return A.a(a,b)
return a[b]},
a0(a,b,c){if(b<0||b>a.length)throw A.d(A.O(b,0,a.length,"start",null))
if(c<b||c>a.length)throw A.d(A.O(c,b,a.length,"end",null))
if(b===c)return A.b([],A.a4(a))
return A.b(a.slice(b,c),A.a4(a))},
gai(a){if(a.length>0)return a[0]
throw A.d(A.bk())},
giq(a){var s=a.length
if(s>0)return a[s-1]
throw A.d(A.bk())},
W(a,b,c,d,e){var s,r,q,p,o
A.a4(a).l("k<1>").a(d)
if(!!a.immutable$list)A.D(A.a_("setRange"))
A.ao(b,c,a.length)
s=c-b
if(s===0)return
A.en(e,"skipCount")
if(t.j.b(d)){r=d
q=e}else{r=J.jR(d,e).b2(0,!1)
q=0}p=J.b9(r)
if(q+s>p.gu(r))throw A.d(A.k9())
if(q<b)for(o=s-1;o>=0;--o)a[b+o]=p.m(r,q+o)
else for(o=0;o<s;++o)a[b+o]=p.m(r,q+o)},
a6(a,b,c,d){var s
A.a4(a).l("1?").a(d)
if(!!a.immutable$list)A.D(A.a_("fill range"))
A.ao(b,c,a.length)
for(s=b;s<c;++s)a[s]=d},
aO(a,b){var s,r
A.a4(a).l("B(1)").a(b)
s=a.length
for(r=0;r<s;++r){if(!A.aP(b.$1(a[r])))return!1
if(a.length!==s)throw A.d(A.ay(a))}return!0},
ah(a,b){var s
for(s=0;s<a.length;++s)if(J.aj(a[s],b))return!0
return!1},
ga7(a){return a.length===0},
gdY(a){return a.length!==0},
t(a){return A.j_(a,"[","]")},
gU(a){return new J.c6(a,a.length,A.a4(a).l("c6<1>"))},
ga3(a){return A.cD(a)},
gu(a){return a.length},
su(a,b){if(!!a.fixed$length)A.D(A.a_("set length"))
if(b<0)throw A.d(A.O(b,0,null,"newLength",null))
if(b>a.length)A.a4(a).c.a(null)
a.length=b},
m(a,b){if(!(b>=0&&b<a.length))throw A.d(A.c4(a,b))
return a[b]},
h(a,b,c){A.n(b)
A.a4(a).c.a(c)
if(!!a.immutable$list)A.D(A.a_("indexed set"))
if(!(b>=0&&b<a.length))throw A.d(A.c4(a,b))
a[b]=c},
$ip:1,
$ik:1,
$ij:1}
J.ft.prototype={}
J.c6.prototype={
gE(){var s=this.d
return s==null?this.$ti.c.a(s):s},
B(){var s,r=this,q=r.a,p=q.length
if(r.b!==p)throw A.d(A.di(q))
s=r.c
if(s>=p){r.sd1(null)
return!1}r.sd1(q[s]);++r.c
return!0},
sd1(a){this.d=this.$ti.l("1?").a(a)},
$iE:1}
J.bl.prototype={
bP(a,b){var s
A.l5(b)
if(a<b)return-1
else if(a>b)return 1
else if(a===b){if(a===0){s=this.gbm(b)
if(this.gbm(a)===s)return 0
if(this.gbm(a))return-1
return 1}return 0}else if(isNaN(a)){if(isNaN(b))return 0
return 1}else return-1},
gbm(a){return a===0?1/a<0:a<0},
n(a){var s
if(a>=-2147483648&&a<=2147483647)return a|0
if(isFinite(a)){s=a<0?Math.ceil(a):Math.floor(a)
return s+0}throw A.d(A.a_(""+a+".toInt()"))},
b_(a){var s,r
if(a>=0){if(a<=2147483647){s=a|0
return a===s?s:s+1}}else if(a>=-2147483648)return a|0
r=Math.ceil(a)
if(isFinite(r))return r
throw A.d(A.a_(""+a+".ceil()"))},
ak(a){if(a>0){if(a!==1/0)return Math.round(a)}else if(a>-1/0)return 0-Math.round(0-a)
throw A.d(A.a_(""+a+".round()"))},
p(a,b,c){if(B.a.bP(b,c)>0)throw A.d(A.b8(b))
if(this.bP(a,b)<0)return b
if(this.bP(a,c)>0)return c
return a},
ar(a,b){var s,r,q,p
if(b<2||b>36)throw A.d(A.O(b,2,36,"radix",null))
s=a.toString(b)
if(B.e.bg(s,s.length-1)!==41)return s
r=/^([\da-z]+)(?:\.([\da-z]+))?\(e\+(\d+)\)$/.exec(s)
if(r==null)A.D(A.a_("Unexpected toString result: "+s))
q=r.length
if(1>=q)return A.a(r,1)
s=r[1]
if(3>=q)return A.a(r,3)
p=+r[3]
q=r[2]
if(q!=null){s+=q
p-=q.length}return s+B.e.af("0",p)},
t(a){if(a===0&&1/a<0)return"-0.0"
else return""+a},
ga3(a){var s,r,q,p,o=a|0
if(a===o)return o&536870911
s=Math.abs(a)
r=Math.log(s)/0.6931471805599453|0
q=Math.pow(2,r)
p=s<1?s/q:q/s
return((p*9007199254740992|0)+(p*3542243181176521|0))*599197+r*1259&536870911},
P(a,b){var s=a%b
if(s===0)return 0
if(s>0)return s
if(b<0)return s-b
else return s+b},
O(a,b){A.l5(b)
if((a|0)===a)if(b>=1||b<-1)return a/b|0
return this.dG(a,b)},
F(a,b){return(a|0)===a?a/b|0:this.dG(a,b)},
dG(a,b){var s=a/b
if(s>=-2147483648&&s<=2147483647)return s|0
if(s>0){if(s!==1/0)return Math.floor(s)}else if(s>-1/0)return Math.ceil(s)
throw A.d(A.a_("Result of truncating division is "+A.r(s)+": "+A.r(a)+" ~/ "+b))},
H(a,b){if(b<0)throw A.d(A.b8(b))
return b>31?0:a<<b>>>0},
A(a,b){return b>31?0:a<<b>>>0},
X(a,b){var s
if(b<0)throw A.d(A.b8(b))
if(a>0)s=this.J(a,b)
else{s=b>31?31:b
s=a>>s>>>0}return s},
i(a,b){var s
if(a>0)s=this.J(a,b)
else{s=b>31?31:b
s=a>>s>>>0}return s},
Z(a,b){if(0>b)throw A.d(A.b8(b))
return this.J(a,b)},
J(a,b){return b>31?0:a>>>b},
M(a,b){return(a&b)>>>0},
$iw:1,
$iag:1}
J.cs.prototype={
R(a,b){var s=this.H(1,b-1)
return((a&s-1)>>>0)-((a&s)>>>0)},
$ie:1}
J.dT.prototype={}
J.bm.prototype={
bg(a,b){if(b<0)throw A.d(A.c4(a,b))
if(b>=a.length)A.D(A.c4(a,b))
return a.charCodeAt(b)},
aU(a,b){if(b>=a.length)throw A.d(A.c4(a,b))
return a.charCodeAt(b)},
b4(a,b){return a+b},
bA(a,b,c){return a.substring(b,A.ao(b,c,a.length))},
j_(a){var s,r,q,p=a.trim(),o=p.length
if(o===0)return p
if(this.aU(p,0)===133){s=J.mr(p,1)
if(s===o)return""}else s=0
r=o-1
q=this.bg(p,r)===133?J.ms(p,r):o
if(s===0&&q===o)return p
return p.substring(s,q)},
af(a,b){var s,r
if(0>=b)return""
if(b===1||a.length===0)return a
if(b!==b>>>0)throw A.d(B.av)
for(s=a,r="";!0;){if((b&1)===1)r=s+r
b=b>>>1
if(b===0)break
s+=s}return r},
t(a){return a},
ga3(a){var s,r,q
for(s=a.length,r=0,q=0;q<s;++q){r=r+a.charCodeAt(q)&536870911
r=r+((r&524287)<<10)&536870911
r^=r>>6}r=r+((r&67108863)<<3)&536870911
r^=r>>11
return r+((r&16383)<<15)&536870911},
gu(a){return a.length},
$iv:1}
A.bn.prototype={
t(a){return"LateInitializationError: "+this.a}}
A.be.prototype={
gu(a){return this.a.length},
m(a,b){return B.e.bg(this.a,b)}}
A.iN.prototype={
$0(){var s=new A.G($.A,t.eq)
s.c_(null)
return s},
$S:37}
A.p.prototype={}
A.T.prototype={
gU(a){var s=this
return new A.bp(s,s.gu(s),A.y(s).l("bp<T.E>"))},
ga7(a){return this.gu(this)===0},
gai(a){if(this.gu(this)===0)throw A.d(A.bk())
return this.ac(0,0)},
aO(a,b){var s,r,q=this
A.y(q).l("B(T.E)").a(b)
s=q.gu(q)
for(r=0;r<s;++r){if(!A.aP(b.$1(q.ac(0,r))))return!1
if(s!==q.gu(q))throw A.d(A.ay(q))}return!0},
aR(a,b){return this.er(0,A.y(this).l("B(T.E)").a(b))},
aQ(a,b,c){var s=A.y(this)
return new A.aG(this,s.D(c).l("1(T.E)").a(b),s.l("@<T.E>").D(c).l("aG<1,2>"))},
b2(a,b){return A.kk(this,!0,A.y(this).l("T.E"))},
cF(a){return this.b2(a,!0)}}
A.cJ.prototype={
gfD(){var s=J.aS(this.a),r=this.c
if(r==null||r>s)return s
return r},
ghP(){var s=J.aS(this.a),r=this.b
if(r>s)return s
return r},
gu(a){var s,r=J.aS(this.a),q=this.b
if(q>=r)return 0
s=this.c
if(s==null||s>=r)return r-q
if(typeof s!=="number")return s.el()
return s-q},
ac(a,b){var s=this,r=s.ghP()+b
if(b<0||r>=s.gfD())throw A.d(A.fr(b,s,"index",null,null))
return J.jP(s.a,r)},
b2(a,b){var s,r,q,p=this,o=p.b,n=p.a,m=J.b9(n),l=m.gu(n),k=p.c
if(k!=null&&k<l)l=k
s=l-o
if(s<=0){n=J.j0(0,p.$ti.c)
return n}r=A.U(s,m.ac(n,o),!1,p.$ti.c)
for(q=1;q<s;++q){B.b.h(r,q,m.ac(n,o+q))
if(m.gu(n)<l)throw A.d(A.ay(p))}return r}}
A.bp.prototype={
gE(){var s=this.d
return s==null?this.$ti.c.a(s):s},
B(){var s,r=this,q=r.a,p=J.b9(q),o=p.gu(q)
if(r.b!==o)throw A.d(A.ay(q))
s=r.c
if(s>=o){r.saA(null)
return!1}r.saA(p.ac(q,s));++r.c
return!0},
saA(a){this.d=this.$ti.l("1?").a(a)},
$iE:1}
A.aF.prototype={
gU(a){var s=A.y(this)
return new A.cx(J.as(this.a),this.b,s.l("@<1>").D(s.z[1]).l("cx<1,2>"))},
gu(a){return J.aS(this.a)},
gai(a){return this.b.$1(J.dj(this.a))}}
A.bh.prototype={$ip:1}
A.cx.prototype={
B(){var s=this,r=s.b
if(r.B()){s.saA(s.c.$1(r.gE()))
return!0}s.saA(null)
return!1},
gE(){var s=this.a
return s==null?this.$ti.z[1].a(s):s},
saA(a){this.a=this.$ti.l("2?").a(a)}}
A.aG.prototype={
gu(a){return J.aS(this.a)},
ac(a,b){return this.b.$1(J.jP(this.a,b))}}
A.S.prototype={
gU(a){return new A.cS(J.as(this.a),this.b,this.$ti.l("cS<1>"))},
aQ(a,b,c){var s=this.$ti
return new A.aF(this,s.D(c).l("1(2)").a(b),s.l("@<1>").D(c).l("aF<1,2>"))}}
A.cS.prototype={
B(){var s,r
for(s=this.a,r=this.b;s.B();)if(A.aP(r.$1(s.gE())))return!0
return!1},
gE(){return this.a.gE()}}
A.cf.prototype={
gU(a){var s=this.$ti
return new A.cg(J.as(this.a),this.b,B.P,s.l("@<1>").D(s.z[1]).l("cg<1,2>"))}}
A.cg.prototype={
gE(){var s=this.d
return s==null?this.$ti.z[1].a(s):s},
B(){var s,r,q=this
if(q.c==null)return!1
for(s=q.a,r=q.b;!q.c.B();){q.saA(null)
if(s.B()){q.sd2(null)
q.sd2(J.as(r.$1(s.gE())))}else return!1}q.saA(q.c.gE())
return!0},
sd2(a){this.c=this.$ti.l("E<2>?").a(a)},
saA(a){this.d=this.$ti.l("2?").a(a)},
$iE:1}
A.bi.prototype={
gU(a){return B.P},
gu(a){return 0},
gai(a){throw A.d(A.bk())},
aR(a,b){this.$ti.l("B(1)").a(b)
return this},
aQ(a,b,c){this.$ti.D(c).l("1(2)").a(b)
return new A.bi(c.l("bi<0>"))},
b2(a,b){var s=J.kb(0,this.$ti.c)
return s},
cF(a){return this.b2(a,!0)}}
A.cb.prototype={
B(){return!1},
gE(){throw A.d(A.bk())},
$iE:1}
A.X.prototype={}
A.bt.prototype={
h(a,b,c){A.n(b)
A.y(this).l("bt.E").a(c)
throw A.d(A.a_("Cannot modify an unmodifiable list"))}}
A.bU.prototype={}
A.ca.prototype={
ga7(a){return this.gu(this)===0},
t(a){return A.j5(this)},
$iab:1}
A.cj.prototype={
aX(){var s,r,q,p=this,o=p.$map
if(o==null){s=p.$ti
r=s.c
q=A.mj(r)
o=A.mu(A.or(),q,r,s.z[1])
A.li(p.a,o)
p.$map=o}return o},
a2(a){return this.aX().a2(a)},
m(a,b){return this.aX().m(0,b)},
aC(a,b){this.$ti.l("~(1,2)").a(b)
this.aX().aC(0,b)},
gaE(){var s=this.aX()
return new A.an(s,A.y(s).l("an<1>"))},
gau(){return this.aX().gau()},
gu(a){return this.aX().a}}
A.fh.prototype={
$1(a){return this.a.b(a)},
$S:29}
A.he.prototype={
aj(a){var s,r,q=this,p=new RegExp(q.a).exec(a)
if(p==null)return null
s=Object.create(null)
r=q.b
if(r!==-1)s.arguments=p[r+1]
r=q.c
if(r!==-1)s.argumentsExpr=p[r+1]
r=q.d
if(r!==-1)s.expr=p[r+1]
r=q.e
if(r!==-1)s.method=p[r+1]
r=q.f
if(r!==-1)s.receiver=p[r+1]
return s}}
A.cB.prototype={
t(a){var s=this.b
if(s==null)return"NoSuchMethodError: "+this.a
return"NoSuchMethodError: method not found: '"+s+"' on null"}}
A.dX.prototype={
t(a){var s,r=this,q="NoSuchMethodError: method not found: '",p=r.b
if(p==null)return"NoSuchMethodError: "+r.a
s=r.c
if(s==null)return q+p+"' ("+r.a+")"
return q+p+"' on '"+s+"' ("+r.a+")"}}
A.eB.prototype={
t(a){var s=this.a
return s.length===0?"Error":"Error: "+s}}
A.fG.prototype={
t(a){return"Throw of null ('"+(this.a===null?"null":"undefined")+"' from JavaScript)"}}
A.cd.prototype={}
A.d5.prototype={
t(a){var s,r=this.b
if(r!=null)return r
r=this.a
s=r!==null&&typeof r==="object"?r.stack:null
return this.b=s==null?"":s},
$ib_:1}
A.bd.prototype={
t(a){var s=this.constructor,r=s==null?null:s.name
return"Closure '"+A.ls(r==null?"unknown":r)+"'"},
$ibj:1,
gj4(){return this},
$C:"$1",
$R:1,
$D:null}
A.dp.prototype={$C:"$0",$R:0}
A.dq.prototype={$C:"$2",$R:2}
A.ev.prototype={}
A.er.prototype={
t(a){var s=this.$static_name
if(s==null)return"Closure of unknown static method"
return"Closure '"+A.ls(s)+"'"}}
A.bF.prototype={
b5(a,b){if(b==null)return!1
if(this===b)return!0
if(!(b instanceof A.bF))return!1
return this.$_target===b.$_target&&this.a===b.a},
ga3(a){return(A.lm(this.a)^A.cD(this.$_target))>>>0},
t(a){return"Closure '"+this.$_name+"' of "+("Instance of '"+A.fN(this.a)+"'")}}
A.eo.prototype={
t(a){return"RuntimeError: "+this.a}}
A.eI.prototype={
t(a){return"Assertion failed: "+A.cc(this.a)}}
A.ah.prototype={
gu(a){return this.a},
ga7(a){return this.a===0},
gaE(){return new A.an(this,A.y(this).l("an<1>"))},
gau(){var s=A.y(this)
return A.km(new A.an(this,s.l("an<1>")),new A.fz(this),s.c,s.z[1])},
a2(a){var s,r
if(typeof a=="string"){s=this.b
if(s==null)return!1
return s[a]!=null}else if(typeof a=="number"&&(a&0x3fffffff)===a){r=this.c
if(r==null)return!1
return r[a]!=null}else return this.dU(a)},
dU(a){var s=this.d
if(s==null)return!1
return this.bl(s[this.bk(a)],a)>=0},
an(a,b){A.y(this).l("ab<1,2>").a(b).aC(0,new A.fy(this))},
m(a,b){var s,r,q,p,o=null
if(typeof b=="string"){s=this.b
if(s==null)return o
r=s[b]
q=r==null?o:r.b
return q}else if(typeof b=="number"&&(b&0x3fffffff)===b){p=this.c
if(p==null)return o
r=p[b]
q=r==null?o:r.b
return q}else return this.dV(b)},
dV(a){var s,r,q=this.d
if(q==null)return null
s=q[this.bk(a)]
r=this.bl(s,a)
if(r<0)return null
return s[r].b},
h(a,b,c){var s,r,q=this,p=A.y(q)
p.c.a(b)
p.z[1].a(c)
if(typeof b=="string"){s=q.b
q.cR(s==null?q.b=q.cj():s,b,c)}else if(typeof b=="number"&&(b&0x3fffffff)===b){r=q.c
q.cR(r==null?q.c=q.cj():r,b,c)}else q.dX(b,c)},
dX(a,b){var s,r,q,p,o=this,n=A.y(o)
n.c.a(a)
n.z[1].a(b)
s=o.d
if(s==null)s=o.d=o.cj()
r=o.bk(a)
q=s[r]
if(q==null)s[r]=[o.ck(a,b)]
else{p=o.bl(q,a)
if(p>=0)q[p].b=b
else q.push(o.ck(a,b))}},
iE(a,b){var s,r,q=this,p=A.y(q)
p.c.a(a)
p.l("2()").a(b)
if(q.a2(a)){s=q.m(0,a)
return s==null?p.z[1].a(s):s}r=b.$0()
q.h(0,a,r)
return r},
bq(a,b){if((b&0x3fffffff)===b)return this.hL(this.c,b)
else return this.dW(b)},
dW(a){var s,r,q,p,o=this,n=o.d
if(n==null)return null
s=o.bk(a)
r=n[s]
q=o.bl(r,a)
if(q<0)return null
p=r.splice(q,1)[0]
o.dJ(p)
if(r.length===0)delete n[s]
return p.b},
aC(a,b){var s,r,q=this
A.y(q).l("~(1,2)").a(b)
s=q.e
r=q.r
for(;s!=null;){b.$2(s.a,s.b)
if(r!==q.r)throw A.d(A.ay(q))
s=s.c}},
cR(a,b,c){var s,r=A.y(this)
r.c.a(b)
r.z[1].a(c)
s=a[b]
if(s==null)a[b]=this.ck(b,c)
else s.b=c},
hL(a,b){var s
if(a==null)return null
s=a[b]
if(s==null)return null
this.dJ(s)
delete a[b]
return s.b},
dm(){this.r=this.r+1&1073741823},
ck(a,b){var s=this,r=A.y(s),q=new A.fA(r.c.a(a),r.z[1].a(b))
if(s.e==null)s.e=s.f=q
else{r=s.f
r.toString
q.d=r
s.f=r.c=q}++s.a
s.dm()
return q},
dJ(a){var s=this,r=a.d,q=a.c
if(r==null)s.e=q
else r.c=q
if(q==null)s.f=r
else q.d=r;--s.a
s.dm()},
bk(a){return J.dk(a)&0x3fffffff},
bl(a,b){var s,r
if(a==null)return-1
s=a.length
for(r=0;r<s;++r)if(J.aj(a[r].a,b))return r
return-1},
t(a){return A.j5(this)},
cj(){var s=Object.create(null)
s["<non-identifier-key>"]=s
delete s["<non-identifier-key>"]
return s},
$ij3:1}
A.fz.prototype={
$1(a){var s=this.a,r=A.y(s)
s=s.m(0,r.c.a(a))
return s==null?r.z[1].a(s):s},
$S(){return A.y(this.a).l("2(1)")}}
A.fy.prototype={
$2(a,b){var s=this.a,r=A.y(s)
s.h(0,r.c.a(a),r.z[1].a(b))},
$S(){return A.y(this.a).l("~(1,2)")}}
A.fA.prototype={}
A.an.prototype={
gu(a){return this.a.a},
ga7(a){return this.a.a===0},
gU(a){var s=this.a,r=new A.bo(s,s.r,this.$ti.l("bo<1>"))
r.c=s.e
return r}}
A.bo.prototype={
gE(){return this.d},
B(){var s,r=this,q=r.a
if(r.b!==q.r)throw A.d(A.ay(q))
s=r.c
if(s==null){r.scQ(null)
return!1}else{r.scQ(s.a)
r.c=s.c
return!0}},
scQ(a){this.d=this.$ti.l("1?").a(a)},
$iE:1}
A.iH.prototype={
$1(a){return this.a(a)},
$S:18}
A.iI.prototype={
$2(a,b){return this.a(a,b)},
$S:33}
A.iJ.prototype={
$1(a){return this.a(A.aN(a))},
$S:44}
A.hP.prototype={
I(){var s=this.b
if(s===this)throw A.d(new A.bn("Local '"+this.a+"' has not been initialized."))
return s},
hs(){var s=this.b
if(s===this)throw A.d(A.ki(this.a))
return s}}
A.cy.prototype={$icy:1}
A.K.prototype={
fT(a,b,c,d){var s=A.O(b,0,c,d,null)
throw A.d(s)},
d_(a,b,c,d){if(b>>>0!==b||b>c)this.fT(a,b,c,d)},
$iK:1,
$iR:1}
A.Q.prototype={
gu(a){return a.length},
dE(a,b,c,d,e){var s,r,q=a.length
this.d_(a,b,q,"start")
this.d_(a,c,q,"end")
if(b>c)throw A.d(A.O(b,0,c,null,null))
s=c-b
if(e<0)throw A.d(A.bE(e,null))
r=d.length
if(r-e<s)throw A.d(A.fV("Not enough elements"))
if(e!==0||r!==s)d=d.subarray(e,e+s)
a.set(d,b)},
$iaa:1}
A.aX.prototype={
m(a,b){A.aO(b,a,a.length)
return a[b]},
h(a,b,c){A.n(b)
A.o4(c)
A.aO(b,a,a.length)
a[b]=c},
W(a,b,c,d,e){t.bM.a(d)
if(t.d4.b(d)){this.dE(a,b,c,d,e)
return}this.cO(a,b,c,d,e)},
$ip:1,
$ik:1,
$ij:1}
A.ac.prototype={
h(a,b,c){A.n(b)
A.n(c)
A.aO(b,a,a.length)
a[b]=c},
W(a,b,c,d,e){t.hb.a(d)
if(t.bc.b(d)){this.dE(a,b,c,d,e)
return}this.cO(a,b,c,d,e)},
by(a,b,c,d){return this.W(a,b,c,d,0)},
$ip:1,
$ik:1,
$ij:1}
A.e3.prototype={
a0(a,b,c){return new Float32Array(a.subarray(b,A.av(b,c,a.length)))},
$imf:1}
A.e4.prototype={
a0(a,b,c){return new Float64Array(a.subarray(b,A.av(b,c,a.length)))}}
A.e5.prototype={
m(a,b){A.aO(b,a,a.length)
return a[b]},
a0(a,b,c){return new Int16Array(a.subarray(b,A.av(b,c,a.length)))},
$iiZ:1}
A.e6.prototype={
m(a,b){A.aO(b,a,a.length)
return a[b]},
a0(a,b,c){return new Int32Array(a.subarray(b,A.av(b,c,a.length)))},
$ifs:1}
A.e7.prototype={
m(a,b){A.aO(b,a,a.length)
return a[b]},
a0(a,b,c){return new Int8Array(a.subarray(b,A.av(b,c,a.length)))},
$imp:1}
A.e8.prototype={
m(a,b){A.aO(b,a,a.length)
return a[b]},
a0(a,b,c){return new Uint16Array(a.subarray(b,A.av(b,c,a.length)))},
$imQ:1}
A.cz.prototype={
m(a,b){A.aO(b,a,a.length)
return a[b]},
a0(a,b,c){return new Uint32Array(a.subarray(b,A.av(b,c,a.length)))},
$iaJ:1}
A.cA.prototype={
gu(a){return a.length},
m(a,b){A.aO(b,a,a.length)
return a[b]},
a0(a,b,c){return new Uint8ClampedArray(a.subarray(b,A.av(b,c,a.length)))}}
A.bq.prototype={
gu(a){return a.length},
m(a,b){A.aO(b,a,a.length)
return a[b]},
a0(a,b,c){return new Uint8Array(a.subarray(b,A.av(b,c,a.length)))},
em(a,b){return this.a0(a,b,null)},
$ibq:1,
$ib1:1}
A.d_.prototype={}
A.d0.prototype={}
A.d1.prototype={}
A.d2.prototype={}
A.ap.prototype={
l(a){return A.io(v.typeUniverse,this,a)},
D(a){return A.o_(v.typeUniverse,this,a)}}
A.eN.prototype={}
A.eM.prototype={
t(a){return this.a}}
A.d7.prototype={$ib0:1}
A.hL.prototype={
$1(a){var s=this.a,r=s.a
s.a=null
r.$0()},
$S:14}
A.hK.prototype={
$1(a){var s,r
this.a.a=t.M.a(a)
s=this.b
r=this.c
s.firstChild?s.removeChild(r):s.appendChild(r)},
$S:21}
A.hM.prototype={
$0(){this.a.$0()},
$S:5}
A.hN.prototype={
$0(){this.a.$0()},
$S:5}
A.il.prototype={
eM(a,b){if(self.setTimeout!=null)self.setTimeout(A.bB(new A.im(this,b),0),a)
else throw A.d(A.a_("`setTimeout()` not found."))}}
A.im.prototype={
$0(){this.b.$0()},
$S:1}
A.eJ.prototype={
bQ(a){var s,r=this,q=r.$ti
q.l("1/?").a(a)
if(a==null)q.c.a(a)
if(!r.b)r.a.c_(a)
else{s=r.a
if(q.l("a8<1>").b(a))s.cZ(a)
else s.c4(q.c.a(a))}},
cs(a,b){var s=this.a
if(this.b)s.b9(a,b)
else s.cW(a,b)}}
A.is.prototype={
$1(a){return this.a.$2(0,a)},
$S:3}
A.it.prototype={
$2(a,b){this.a.$2(1,new A.cd(a,t.l.a(b)))},
$S:45}
A.iy.prototype={
$2(a,b){this.a(A.n(a),b)},
$S:47}
A.bY.prototype={
t(a){return"IterationMarker("+this.b+", "+A.r(this.a)+")"}}
A.c_.prototype={
gE(){var s,r=this.c
if(r==null){s=this.b
return s==null?this.$ti.c.a(s):s}return r.gE()},
B(){var s,r,q,p,o,n,m=this
for(s=m.$ti.l("E<1>");!0;){r=m.c
if(r!=null)if(r.B())return!0
else m.sdr(null)
q=function(a,b,c){var l,k=b
while(true)try{return a(k,l)}catch(j){l=j
k=c}}(m.a,0,1)
if(q instanceof A.bY){p=q.b
if(p===2){o=m.d
if(o==null||o.length===0){m.scV(null)
return!1}if(0>=o.length)return A.a(o,-1)
m.a=o.pop()
continue}else{r=q.a
if(p===3)throw r
else{n=s.a(J.as(r))
if(n instanceof A.c_){r=m.d
if(r==null)r=m.d=[]
B.b.v(r,m.a)
m.a=n.a
continue}else{m.sdr(n)
continue}}}}else{m.scV(q)
return!0}}return!1},
scV(a){this.b=this.$ti.l("1?").a(a)},
sdr(a){this.c=this.$ti.l("E<1>?").a(a)},
$iE:1}
A.d6.prototype={
gU(a){return new A.c_(this.a(),this.$ti.l("c_<1>"))}}
A.c8.prototype={
t(a){return A.r(this.a)},
$ix:1,
gbz(){return this.b}}
A.eL.prototype={
cs(a,b){var s
A.c3(a,"error",t.K)
s=this.a
if((s.a&30)!==0)throw A.d(A.fV("Future already completed"))
if(b==null)b=A.jT(a)
s.cW(a,b)},
dP(a){return this.cs(a,null)}}
A.bx.prototype={
bQ(a){var s,r=this.$ti
r.l("1/?").a(a)
s=this.a
if((s.a&30)!==0)throw A.d(A.fV("Future already completed"))
s.c_(r.l("1/").a(a))},
i1(){return this.bQ(null)}}
A.aM.prototype={
ir(a){if((this.c&15)!==6)return!0
return this.b.b.cD(t.al.a(this.d),a.a,t.v,t.K)},
im(a){var s,r=this,q=r.e,p=null,o=t.z,n=t.K,m=a.a,l=r.b.b
if(t.C.b(q))p=l.iR(q,m,a.b,o,n,t.l)
else p=l.cD(t.x.a(q),m,o,n)
try{o=r.$ti.l("2/").a(p)
return o}catch(s){if(t.eK.b(A.a1(s))){if((r.c&1)!==0)throw A.d(A.bE("The error handler of Future.then must return a value of the returned future's type","onError"))
throw A.d(A.bE("The error handler of Future.catchError must return a value of the future's type","onError"))}else throw s}}}
A.G.prototype={
cE(a,b,c){var s,r,q,p=this.$ti
p.D(c).l("1/(2)").a(a)
s=$.A
if(s===B.f){if(b!=null&&!t.C.b(b)&&!t.x.b(b))throw A.d(A.jS(b,"onError",u.b))}else{c.l("@<0/>").D(p.c).l("1(2)").a(a)
if(b!=null)b=A.ot(b,s)}r=new A.G(s,c.l("G<0>"))
q=b==null?1:3
this.bB(new A.aM(r,q,a,b,p.l("@<1>").D(c).l("aM<1,2>")))
return r},
iV(a,b){return this.cE(a,null,b)},
dH(a,b,c){var s,r=this.$ti
r.D(c).l("1/(2)").a(a)
s=new A.G($.A,c.l("G<0>"))
this.bB(new A.aM(s,3,a,b,r.l("@<1>").D(c).l("aM<1,2>")))
return s},
hN(a){this.a=this.a&1|16
this.c=a},
c2(a){this.a=a.a&30|this.a&1
this.c=a.c},
bB(a){var s,r=this,q=r.a
if(q<=3){a.a=t.F.a(r.c)
r.c=a}else{if((q&4)!==0){s=t.d.a(r.c)
if((s.a&24)===0){s.bB(a)
return}r.c2(s)}A.bA(null,null,r.b,t.M.a(new A.hV(r,a)))}},
dw(a){var s,r,q,p,o,n,m=this,l={}
l.a=a
if(a==null)return
s=m.a
if(s<=3){r=t.F.a(m.c)
m.c=a
if(r!=null){q=a.a
for(p=a;q!=null;p=q,q=o)o=q.a
p.a=r}}else{if((s&4)!==0){n=t.d.a(m.c)
if((n.a&24)===0){n.dw(a)
return}m.c2(n)}l.a=m.bL(a)
A.bA(null,null,m.b,t.M.a(new A.i1(l,m)))}},
bK(){var s=t.F.a(this.c)
this.c=null
return this.bL(s)},
bL(a){var s,r,q
for(s=a,r=null;s!=null;r=s,s=q){q=s.a
s.a=r}return r},
f8(a){var s,r,q,p=this
p.a^=2
try{a.cE(new A.hY(p),new A.hZ(p),t.P)}catch(q){s=A.a1(q)
r=A.af(q)
A.p7(new A.i_(p,s,r))}},
c4(a){var s,r=this
r.$ti.c.a(a)
s=r.bK()
r.a=8
r.c=a
A.bX(r,s)},
b9(a,b){var s
t.l.a(b)
s=this.bK()
this.hN(A.f1(a,b))
A.bX(this,s)},
c_(a){var s=this.$ti
s.l("1/").a(a)
if(s.l("a8<1>").b(a)){this.cZ(a)
return}this.f3(s.c.a(a))},
f3(a){var s=this
s.$ti.c.a(a)
s.a^=2
A.bA(null,null,s.b,t.M.a(new A.hX(s,a)))},
cZ(a){var s=this,r=s.$ti
r.l("a8<1>").a(a)
if(r.b(a)){if((a.a&16)!==0){s.a^=2
A.bA(null,null,s.b,t.M.a(new A.i0(s,a)))}else A.jl(a,s)
return}s.f8(a)},
cW(a,b){this.a^=2
A.bA(null,null,this.b,t.M.a(new A.hW(this,a,b)))},
$ia8:1}
A.hV.prototype={
$0(){A.bX(this.a,this.b)},
$S:1}
A.i1.prototype={
$0(){A.bX(this.b,this.a.a)},
$S:1}
A.hY.prototype={
$1(a){var s,r,q,p=this.a
p.a^=2
try{p.c4(p.$ti.c.a(a))}catch(q){s=A.a1(q)
r=A.af(q)
p.b9(s,r)}},
$S:14}
A.hZ.prototype={
$2(a,b){this.a.b9(t.K.a(a),t.l.a(b))},
$S:36}
A.i_.prototype={
$0(){this.a.b9(this.b,this.c)},
$S:1}
A.hX.prototype={
$0(){this.a.c4(this.b)},
$S:1}
A.i0.prototype={
$0(){A.jl(this.b,this.a)},
$S:1}
A.hW.prototype={
$0(){this.a.b9(this.b,this.c)},
$S:1}
A.i4.prototype={
$0(){var s,r,q,p,o,n,m=this,l=null
try{q=m.a.a
l=q.b.b.e4(t.O.a(q.d),t.z)}catch(p){s=A.a1(p)
r=A.af(p)
q=m.c&&t.n.a(m.b.a.c).a===s
o=m.a
if(q)o.c=t.n.a(m.b.a.c)
else o.c=A.f1(s,r)
o.b=!0
return}if(l instanceof A.G&&(l.a&24)!==0){if((l.a&16)!==0){q=m.a
q.c=t.n.a(l.c)
q.b=!0}return}if(t.c.b(l)){n=m.b.a
q=m.a
q.c=l.iV(new A.i5(n),t.z)
q.b=!1}},
$S:1}
A.i5.prototype={
$1(a){return this.a},
$S:24}
A.i3.prototype={
$0(){var s,r,q,p,o,n,m,l
try{q=this.a
p=q.a
o=p.$ti
n=o.c
m=n.a(this.b)
q.c=p.b.b.cD(o.l("2/(1)").a(p.d),m,o.l("2/"),n)}catch(l){s=A.a1(l)
r=A.af(l)
q=this.a
q.c=A.f1(s,r)
q.b=!0}},
$S:1}
A.i2.prototype={
$0(){var s,r,q,p,o,n,m=this
try{s=t.n.a(m.a.a.c)
p=m.b
if(p.a.ir(s)&&p.a.e!=null){p.c=p.a.im(s)
p.b=!1}}catch(o){r=A.a1(o)
q=A.af(o)
p=t.n.a(m.a.a.c)
n=m.b
if(p.a===r)n.c=p
else n.c=A.f1(r,q)
n.b=!0}},
$S:1}
A.eK.prototype={}
A.bS.prototype={
gu(a){var s,r,q=this,p={},o=new A.G($.A,t.fJ)
p.a=0
s=q.$ti
r=s.l("~(1)?").a(new A.fW(p,q))
t.Z.a(new A.fX(p,o))
A.hS(q.a,q.b,r,!1,s.c)
return o}}
A.fW.prototype={
$1(a){this.b.$ti.c.a(a);++this.a.a},
$S(){return this.b.$ti.l("~(1)")}}
A.fX.prototype={
$0(){var s=this.b,r=s.$ti,q=r.l("1/").a(this.a.a),p=s.bK()
r.c.a(q)
s.a=8
s.c=q
A.bX(s,p)},
$S:1}
A.es.prototype={}
A.et.prototype={}
A.eS.prototype={}
A.da.prototype={$ikS:1}
A.ix.prototype={
$0(){var s=this.a,r=this.b
A.c3(s,"error",t.K)
A.c3(r,"stackTrace",t.l)
A.m7(s,r)},
$S:1}
A.eR.prototype={
iS(a){var s,r,q
t.M.a(a)
try{if(B.f===$.A){a.$0()
return}A.la(null,null,this,a,t.H)}catch(q){s=A.a1(q)
r=A.af(q)
A.iw(t.K.a(s),t.l.a(r))}},
iT(a,b,c){var s,r,q
c.l("~(0)").a(a)
c.a(b)
try{if(B.f===$.A){a.$1(b)
return}A.lb(null,null,this,a,b,t.H,c)}catch(q){s=A.a1(q)
r=A.af(q)
A.iw(t.K.a(s),t.l.a(r))}},
dM(a){return new A.ig(this,t.M.a(a))},
hV(a,b){return new A.ih(this,b.l("~(0)").a(a),b)},
e4(a,b){b.l("0()").a(a)
if($.A===B.f)return a.$0()
return A.la(null,null,this,a,b)},
cD(a,b,c,d){c.l("@<0>").D(d).l("1(2)").a(a)
d.a(b)
if($.A===B.f)return a.$1(b)
return A.lb(null,null,this,a,b,c,d)},
iR(a,b,c,d,e,f){d.l("@<0>").D(e).D(f).l("1(2,3)").a(a)
e.a(b)
f.a(c)
if($.A===B.f)return a.$2(b,c)
return A.ou(null,null,this,a,b,c,d,e,f)},
e3(a,b,c,d){return b.l("@<0>").D(c).D(d).l("1(2,3)").a(a)}}
A.ig.prototype={
$0(){return this.a.iS(this.b)},
$S:1}
A.ih.prototype={
$1(a){var s=this.c
return this.a.iT(this.b,s.a(a),s)},
$S(){return this.c.l("~(0)")}}
A.cV.prototype={
m(a,b){if(!A.aP(this.y.$1(b)))return null
return this.eu(b)},
h(a,b,c){var s=this.$ti
this.ew(s.c.a(b),s.z[1].a(c))},
a2(a){if(!A.aP(this.y.$1(a)))return!1
return this.es(a)},
bq(a,b){if(!A.aP(this.y.$1(b)))return null
return this.ev(b)},
bk(a){return this.x.$1(this.$ti.c.a(a))&1073741823},
bl(a,b){var s,r,q,p
if(a==null)return-1
s=a.length
for(r=this.$ti.c,q=this.w,p=0;p<s;++p)if(A.aP(q.$2(r.a(a[p].a),r.a(b))))return p
return-1}}
A.ie.prototype={
$1(a){return this.a.b(a)},
$S:4}
A.cW.prototype={
gU(a){var s=this,r=new A.by(s,s.r,s.$ti.l("by<1>"))
r.c=s.e
return r},
gu(a){return this.a},
ah(a,b){var s,r
if(typeof b=="string"&&b!=="__proto__"){s=this.b
if(s==null)return!1
return t.g.a(s[b])!=null}else if(typeof b=="number"&&(b&1073741823)===b){r=this.c
if(r==null)return!1
return t.g.a(r[b])!=null}else return this.fa(b)},
fa(a){var s=this.d
if(s==null)return!1
return this.d7(s[J.dk(a)&1073741823],a)>=0},
gai(a){var s=this.e
if(s==null)throw A.d(A.fV("No elements"))
return this.$ti.c.a(s.a)},
v(a,b){var s,r,q=this
q.$ti.c.a(b)
if(typeof b=="string"&&b!=="__proto__"){s=q.b
return q.d0(s==null?q.b=A.jm():s,b)}else if(typeof b=="number"&&(b&1073741823)===b){r=q.c
return q.d0(r==null?q.c=A.jm():r,b)}else return q.f_(b)},
f_(a){var s,r,q,p=this
p.$ti.c.a(a)
s=p.d
if(s==null)s=p.d=A.jm()
r=J.dk(a)&1073741823
q=s[r]
if(q==null)s[r]=[p.c3(a)]
else{if(p.d7(q,a)>=0)return!1
q.push(p.c3(a))}return!0},
d0(a,b){this.$ti.c.a(b)
if(t.g.a(a[b])!=null)return!1
a[b]=this.c3(b)
return!0},
c3(a){var s=this,r=new A.eQ(s.$ti.c.a(a))
if(s.e==null)s.e=s.f=r
else s.f=s.f.b=r;++s.a
s.r=s.r+1&1073741823
return r},
d7(a,b){var s,r
if(a==null)return-1
s=a.length
for(r=0;r<s;++r)if(J.aj(a[r].a,b))return r
return-1}}
A.eQ.prototype={}
A.by.prototype={
gE(){var s=this.d
return s==null?this.$ti.c.a(s):s},
B(){var s=this,r=s.c,q=s.a
if(s.b!==q.r)throw A.d(A.ay(q))
else if(r==null){s.sb8(null)
return!1}else{s.sb8(s.$ti.l("1?").a(r.a))
s.c=r.b
return!0}},
sb8(a){this.d=this.$ti.l("1?").a(a)},
$iE:1}
A.cq.prototype={}
A.cv.prototype={$ip:1,$ik:1,$ij:1}
A.u.prototype={
gU(a){return new A.bp(a,this.gu(a),A.a5(a).l("bp<u.E>"))},
ac(a,b){return this.m(a,b)},
ga7(a){return this.gu(a)===0},
gdY(a){return this.gu(a)!==0},
gai(a){if(this.gu(a)===0)throw A.d(A.bk())
return this.m(a,0)},
aO(a,b){var s,r
A.a5(a).l("B(u.E)").a(b)
s=this.gu(a)
for(r=0;r<s;++r){if(!A.aP(b.$1(this.m(a,r))))return!1
if(s!==this.gu(a))throw A.d(A.ay(a))}return!0},
aR(a,b){var s=A.a5(a)
return new A.S(a,s.l("B(u.E)").a(b),s.l("S<u.E>"))},
aQ(a,b,c){var s=A.a5(a)
return new A.aG(a,s.D(c).l("1(u.E)").a(b),s.l("@<u.E>").D(c).l("aG<1,2>"))},
cM(a,b){return A.jf(a,b,null,A.a5(a).l("u.E"))},
a0(a,b,c){var s,r=this.gu(a)
A.ao(b,c,r)
A.ao(b,c,this.gu(a))
s=A.a5(a).l("u.E")
return A.kj(A.jf(a,b,c,s),s)},
a6(a,b,c,d){var s
A.a5(a).l("u.E?").a(d)
A.ao(b,c,this.gu(a))
for(s=b;s<c;++s)this.h(a,s,d)},
W(a,b,c,d,e){var s,r,q,p,o=A.a5(a)
o.l("k<u.E>").a(d)
A.ao(b,c,this.gu(a))
s=c-b
if(s===0)return
A.en(e,"skipCount")
if(o.l("j<u.E>").b(d)){r=e
q=d}else{q=J.jR(d,e).b2(0,!1)
r=0}if(r+s>q.length)throw A.d(A.k9())
if(r<b)for(p=s-1;p>=0;--p){o=r+p
if(!(o>=0&&o<q.length))return A.a(q,o)
this.h(a,b+p,q[o])}else for(p=0;p<s;++p){o=r+p
if(!(o>=0&&o<q.length))return A.a(q,o)
this.h(a,b+p,q[o])}},
t(a){return A.j_(a,"[","]")}}
A.cw.prototype={}
A.fD.prototype={
$2(a,b){var s,r=this.a
if(!r.a)this.b.a+=", "
r.a=!1
r=this.b
s=r.a+=A.r(a)
r.a=s+": "
r.a+=A.r(b)},
$S:6}
A.V.prototype={
aC(a,b){var s,r,q,p=A.y(this)
p.l("~(V.K,V.V)").a(b)
for(s=this.gaE(),s=s.gU(s),p=p.l("V.V");s.B();){r=s.gE()
q=this.m(0,r)
b.$2(r,q==null?p.a(q):q)}},
gu(a){var s=this.gaE()
return s.gu(s)},
ga7(a){var s=this.gaE()
return s.ga7(s)},
gau(){var s=A.y(this)
return new A.cY(this,s.l("@<V.K>").D(s.l("V.V")).l("cY<1,2>"))},
t(a){return A.j5(this)},
$iab:1}
A.cY.prototype={
gu(a){var s=this.a
return s.gu(s)},
gai(a){var s=this.a,r=s.gaE()
r=s.m(0,r.gai(r))
return r==null?this.$ti.z[1].a(r):r},
gU(a){var s=this.a,r=this.$ti,q=s.gaE()
return new A.cZ(q.gU(q),s,r.l("@<1>").D(r.z[1]).l("cZ<1,2>"))}}
A.cZ.prototype={
B(){var s=this,r=s.a
if(r.B()){s.sb8(s.b.m(0,r.gE()))
return!0}s.sb8(null)
return!1},
gE(){var s=this.c
return s==null?this.$ti.z[1].a(s):s},
sb8(a){this.c=this.$ti.l("2?").a(a)},
$iE:1}
A.cG.prototype={
aQ(a,b,c){var s=this.$ti
return new A.bh(this,s.D(c).l("1(2)").a(b),s.l("@<1>").D(c).l("bh<1,2>"))},
t(a){return A.j_(this,"{","}")},
aR(a,b){var s=this.$ti
return new A.S(this,s.l("B(1)").a(b),s.l("S<1>"))},
gai(a){var s,r=A.nL(this,this.r,this.$ti.c)
if(!r.B())throw A.d(A.bk())
s=r.d
return s==null?r.$ti.c.a(s):s}}
A.d4.prototype={$ip:1,$ik:1,$ijc:1}
A.cX.prototype={}
A.db.prototype={}
A.hh.prototype={
$0(){var s,r
try{s=new TextDecoder("utf-8",{fatal:true})
return s}catch(r){}return null},
$S:12}
A.hg.prototype={
$0(){var s,r
try{s=new TextDecoder("utf-8",{fatal:false})
return s}catch(r){}return null},
$S:12}
A.eV.prototype={
ct(a){var s,r,q,p
t.L.a(a)
s=a.length
r=A.ao(0,null,s)
for(q=0;q<r;++q){if(!(q<s))return A.a(a,q)
p=a[q]
if((p&4294967040)!==0){if(!this.a)throw A.d(A.iX("Invalid value in input: "+p,null,null))
return this.fb(a,0,r)}}return A.fY(a,0,r)},
fb(a,b,c){var s,r,q,p
t.L.a(a)
for(s=a.length,r=b,q="";r<c;++r){if(!(r<s))return A.a(a,r)
p=a[r]
q+=A.C((p&4294967040)!==0?65533:p)}return q.charCodeAt(0)==0?q:q}}
A.bI.prototype={}
A.bf.prototype={}
A.du.prototype={}
A.cu.prototype={
t(a){var s=A.cc(this.a)
return(this.b!=null?"Converting object to an encodable object failed:":"Converting object did not return an encodable object:")+" "+s}}
A.dZ.prototype={
t(a){return"Cyclic error in JSON stringify"}}
A.dY.prototype={
dS(a,b){var s
t.dA.a(b)
s=this.gie()
s=A.kW(a,s.b,s.a)
return s},
gie(){return B.aH}}
A.e_.prototype={}
A.ic.prototype={
cH(a){var s,r,q,p,o,n,m=a.length
for(s=this.c,r=0,q=0;q<m;++q){p=B.e.aU(a,q)
if(p>92){if(p>=55296){o=p&64512
if(o===55296){n=q+1
n=!(n<m&&(B.e.aU(a,n)&64512)===56320)}else n=!1
if(!n)if(o===56320){o=q-1
o=!(o>=0&&(B.e.bg(a,o)&64512)===55296)}else o=!1
else o=!0
if(o){if(q>r)s.a+=B.e.bA(a,r,q)
r=q+1
o=s.a+=A.C(92)
o+=A.C(117)
s.a=o
o+=A.C(100)
s.a=o
n=p>>>8&15
o+=A.C(n<10?48+n:87+n)
s.a=o
n=p>>>4&15
o+=A.C(n<10?48+n:87+n)
s.a=o
n=p&15
s.a=o+A.C(n<10?48+n:87+n)}}continue}if(p<32){if(q>r)s.a+=B.e.bA(a,r,q)
r=q+1
o=s.a+=A.C(92)
switch(p){case 8:s.a=o+A.C(98)
break
case 9:s.a=o+A.C(116)
break
case 10:s.a=o+A.C(110)
break
case 12:s.a=o+A.C(102)
break
case 13:s.a=o+A.C(114)
break
default:o+=A.C(117)
s.a=o
o+=A.C(48)
s.a=o
o+=A.C(48)
s.a=o
n=p>>>4&15
o+=A.C(n<10?48+n:87+n)
s.a=o
n=p&15
s.a=o+A.C(n<10?48+n:87+n)
break}}else if(p===34||p===92){if(q>r)s.a+=B.e.bA(a,r,q)
r=q+1
o=s.a+=A.C(92)
s.a=o+A.C(p)}}if(r===0)s.a+=a
else if(r<m)s.a+=B.e.bA(a,r,m)},
c0(a){var s,r,q,p
for(s=this.a,r=s.length,q=0;q<r;++q){p=s[q]
if(a==null?p==null:a===p)throw A.d(new A.dZ(a,null))}B.b.v(s,a)},
aS(a){var s,r,q,p,o=this
if(o.eb(a))return
o.c0(a)
try{s=o.b.$1(a)
if(!o.eb(s)){q=A.kh(a,null,o.gdu())
throw A.d(q)}q=o.a
if(0>=q.length)return A.a(q,-1)
q.pop()}catch(p){r=A.a1(p)
q=A.kh(a,r,o.gdu())
throw A.d(q)}},
eb(a){var s,r,q=this
if(typeof a=="number"){if(!isFinite(a))return!1
q.c.a+=B.c.t(a)
return!0}else if(a===!0){q.c.a+="true"
return!0}else if(a===!1){q.c.a+="false"
return!0}else if(a==null){q.c.a+="null"
return!0}else if(typeof a=="string"){s=q.c
s.a+='"'
q.cH(a)
s.a+='"'
return!0}else if(t.j.b(a)){q.c0(a)
q.ec(a)
s=q.a
if(0>=s.length)return A.a(s,-1)
s.pop()
return!0}else if(t.f.b(a)){q.c0(a)
r=q.ed(a)
s=q.a
if(0>=s.length)return A.a(s,-1)
s.pop()
return r}else return!1},
ec(a){var s,r,q=this.c
q.a+="["
s=J.b9(a)
if(s.gdY(a)){this.aS(s.m(a,0))
for(r=1;r<s.gu(a);++r){q.a+=","
this.aS(s.m(a,r))}}q.a+="]"},
ed(a){var s,r,q,p,o,n,m=this,l={}
if(a.ga7(a)){m.c.a+="{}"
return!0}s=a.gu(a)*2
r=A.U(s,null,!1,t.X)
q=l.a=0
l.b=!0
a.aC(0,new A.id(l,r))
if(!l.b)return!1
p=m.c
p.a+="{"
for(o='"';q<s;q+=2,o=',"'){p.a+=o
m.cH(A.aN(r[q]))
p.a+='":'
n=q+1
if(!(n<s))return A.a(r,n)
m.aS(r[n])}p.a+="}"
return!0}}
A.id.prototype={
$2(a,b){var s,r
if(typeof a!="string")this.a.b=!1
s=this.b
r=this.a
B.b.h(s,r.a++,a)
B.b.h(s,r.a++,b)},
$S:6}
A.i9.prototype={
ec(a){var s,r=this,q=J.b9(a),p=q.ga7(a),o=r.c,n=o.a
if(p)o.a=n+"[]"
else{o.a=n+"[\n"
r.bu(++r.a$)
r.aS(q.m(a,0))
for(s=1;s<q.gu(a);++s){o.a+=",\n"
r.bu(r.a$)
r.aS(q.m(a,s))}o.a+="\n"
r.bu(--r.a$)
o.a+="]"}},
ed(a){var s,r,q,p,o,n,m=this,l={}
if(a.ga7(a)){m.c.a+="{}"
return!0}s=a.gu(a)*2
r=A.U(s,null,!1,t.X)
q=l.a=0
l.b=!0
a.aC(0,new A.ia(l,r))
if(!l.b)return!1
p=m.c
p.a+="{\n";++m.a$
for(o="";q<s;q+=2,o=",\n"){p.a+=o
m.bu(m.a$)
p.a+='"'
m.cH(A.aN(r[q]))
p.a+='": '
n=q+1
if(!(n<s))return A.a(r,n)
m.aS(r[n])}p.a+="\n"
m.bu(--m.a$)
p.a+="}"
return!0}}
A.ia.prototype={
$2(a,b){var s,r
if(typeof a!="string")this.a.b=!1
s=this.b
r=this.a
B.b.h(s,r.a++,a)
B.b.h(s,r.a++,b)},
$S:6}
A.eP.prototype={
gdu(){var s=this.c.a
return s.charCodeAt(0)==0?s:s}}
A.ib.prototype={
bu(a){var s,r,q
for(s=this.f,r=this.c,q=0;q<a;++q)r.a+=s}}
A.e0.prototype={
bS(a){var s
t.L.a(a)
s=B.aI.ct(a)
return s}}
A.e1.prototype={}
A.eD.prototype={
ct(a){var s,r
t.L.a(a)
s=this.a
r=A.mS(s,a,0,null)
if(r!=null)return r
return new A.ip(s).i3(a,0,null,!0)}}
A.ip.prototype={
i3(a,b,c,d){var s,r,q,p,o,n=this
t.L.a(a)
s=A.ao(b,c,a.length)
if(b===s)return""
r=A.o2(a,b,s)
q=n.c5(r,0,s-b,!0)
p=n.b
if((p&1)!==0){o=A.o3(p)
n.b=0
throw A.d(A.iX(o,a,b+n.c))}return q},
c5(a,b,c,d){var s,r,q=this
if(c-b>1000){s=B.a.F(b+c,2)
r=q.c5(a,b,s,!1)
if((q.b&1)!==0)return r
return r+q.c5(a,s,c,d)}return q.i8(a,b,c,d)},
i8(a,b,c,d){var s,r,q,p,o,n,m,l,k=this,j=65533,i=k.b,h=k.c,g=new A.bs(""),f=b+1,e=a.length
if(!(b>=0&&b<e))return A.a(a,b)
s=a[b]
$label0$0:for(r=k.a;!0;){for(;!0;f=o){q=B.e.aU("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFFFFFFFFFFFFFFFFGGGGGGGGGGGGGGGGHHHHHHHHHHHHHHHHHHHHHHHHHHHIHHHJEEBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBKCCCCCCCCCCCCDCLONNNMEEEEEEEEEEE",s)&31
h=i<=32?s&61694>>>q:(s&63|h<<6)>>>0
i=B.e.aU(" \x000:XECCCCCN:lDb \x000:XECCCCCNvlDb \x000:XECCCCCN:lDb AAAAA\x00\x00\x00\x00\x00AAAAA00000AAAAA:::::AAAAAGG000AAAAA00KKKAAAAAG::::AAAAA:IIIIAAAAA000\x800AAAAA\x00\x00\x00\x00 AAAAA",i+q)
if(i===0){g.a+=A.C(h)
if(f===c)break $label0$0
break}else if((i&1)!==0){if(r)switch(i){case 69:case 67:g.a+=A.C(j)
break
case 65:g.a+=A.C(j);--f
break
default:p=g.a+=A.C(j)
g.a=p+A.C(j)
break}else{k.b=i
k.c=f-1
return""}i=0}if(f===c)break $label0$0
o=f+1
if(!(f>=0&&f<e))return A.a(a,f)
s=a[f]}o=f+1
if(!(f>=0&&f<e))return A.a(a,f)
s=a[f]
if(s<128){while(!0){if(!(o<c)){n=c
break}m=o+1
if(!(o>=0&&o<e))return A.a(a,o)
s=a[o]
if(s>=128){n=m-1
o=m
break}o=m}if(n-f<20)for(l=f;l<n;++l){if(!(l<e))return A.a(a,l)
g.a+=A.C(a[l])}else g.a+=A.fY(a,f,n)
if(n===c)break $label0$0
f=o}else f=o}if(d&&i>32)if(r)g.a+=A.C(j)
else{k.b=77
k.c=c
return""}k.b=i
k.c=h
e=g.a
return e.charCodeAt(0)==0?e:e}}
A.eX.prototype={}
A.bg.prototype={
b5(a,b){if(b==null)return!1
return b instanceof A.bg&&this.a===b.a&&this.b===b.b},
ga3(a){var s=this.a
return(s^B.a.i(s,30))&1073741823},
iX(){if(this.b)return this
return A.m4(this.a,!0)},
t(a){var s=this,r=A.k_(A.ee(s)),q=A.az(A.kv(s)),p=A.az(A.kr(s)),o=A.az(A.ks(s)),n=A.az(A.ku(s)),m=A.az(A.kw(s)),l=A.k0(A.kt(s)),k=r+"-"+q
if(s.b)return k+"-"+p+" "+o+":"+n+":"+m+"."+l+"Z"
else return k+"-"+p+" "+o+":"+n+":"+m+"."+l},
iW(){var s=this,r=A.ee(s)>=-9999&&A.ee(s)<=9999?A.k_(A.ee(s)):A.m5(A.ee(s)),q=A.az(A.kv(s)),p=A.az(A.kr(s)),o=A.az(A.ks(s)),n=A.az(A.ku(s)),m=A.az(A.kw(s)),l=A.k0(A.kt(s)),k=r+"-"+q
if(s.b)return k+"-"+p+"T"+o+":"+n+":"+m+"."+l+"Z"
else return k+"-"+p+"T"+o+":"+n+":"+m+"."+l}}
A.hQ.prototype={}
A.x.prototype={
gbz(){return A.af(this.$thrownJsError)}}
A.c7.prototype={
t(a){var s=this.a
if(s!=null)return"Assertion failed: "+A.cc(s)
return"Assertion failed"}}
A.b0.prototype={}
A.e9.prototype={
t(a){return"Throw of null."}}
A.at.prototype={
gc9(){return"Invalid argument"+(!this.a?"(s)":"")},
gc8(){return""},
t(a){var s=this,r=s.c,q=r==null?"":" ("+r+")",p=s.d,o=p==null?"":": "+A.r(p),n=s.gc9()+q+o
if(!s.a)return n
return n+s.gc8()+": "+A.cc(s.b)}}
A.bQ.prototype={
gc9(){return"RangeError"},
gc8(){var s,r=this.e,q=this.f
if(r==null)s=q!=null?": Not less than or equal to "+A.r(q):""
else if(q==null)s=": Not greater than or equal to "+A.r(r)
else if(q>r)s=": Not in inclusive range "+A.r(r)+".."+A.r(q)
else s=q<r?": Valid value range is empty":": Only valid value is "+A.r(r)
return s}}
A.dF.prototype={
gc9(){return"RangeError"},
gc8(){if(A.n(this.b)<0)return": index must not be negative"
var s=this.f
if(s===0)return": no indices are valid"
return": index should be less than "+s},
gu(a){return this.f}}
A.eC.prototype={
t(a){return"Unsupported operation: "+this.a}}
A.ez.prototype={
t(a){var s=this.a
return s!=null?"UnimplementedError: "+s:"UnimplementedError"}}
A.bR.prototype={
t(a){return"Bad state: "+this.a}}
A.ds.prototype={
t(a){var s=this.a
if(s==null)return"Concurrent modification during iteration."
return"Concurrent modification during iteration: "+A.cc(s)+"."}}
A.ea.prototype={
t(a){return"Out of Memory"},
gbz(){return null},
$ix:1}
A.cI.prototype={
t(a){return"Stack Overflow"},
gbz(){return null},
$ix:1}
A.dt.prototype={
t(a){return"Reading static variable '"+this.a+"' during its initialization"}}
A.hU.prototype={
t(a){return"Exception: "+this.a}}
A.dz.prototype={
t(a){var s=this.a,r=""!==s?"FormatException: "+s:"FormatException",q=this.c
return q!=null?r+(" (at offset "+A.r(q)+")"):r}}
A.k.prototype={
aQ(a,b,c){var s=A.y(this)
return A.km(this,s.D(c).l("1(k.E)").a(b),s.l("k.E"),c)},
aR(a,b){var s=A.y(this)
return new A.S(this,s.l("B(k.E)").a(b),s.l("S<k.E>"))},
aO(a,b){var s
A.y(this).l("B(k.E)").a(b)
for(s=this.gU(this);s.B();)if(!A.aP(b.$1(s.gE())))return!1
return!0},
gu(a){var s,r=this.gU(this)
for(s=0;r.B();)++s
return s},
ga7(a){return!this.gU(this).B()},
gai(a){var s=this.gU(this)
if(!s.B())throw A.d(A.bk())
return s.gE()},
ac(a,b){var s,r,q
A.en(b,"index")
for(s=this.gU(this),r=0;s.B();){q=s.gE()
if(b===r)return q;++r}throw A.d(A.fr(b,this,"index",null,r))},
t(a){return A.mq(this,"(",")")}}
A.cU.prototype={
ac(a,b){var s=this.a
if(0>b||b>=s)A.D(A.fr(b,this,"index",null,s))
return this.b.$1(b)},
gu(a){return this.a}}
A.E.prototype={}
A.F.prototype={
ga3(a){return A.q.prototype.ga3.call(this,this)},
t(a){return"null"}}
A.q.prototype={$iq:1,
b5(a,b){return this===b},
ga3(a){return A.cD(this)},
t(a){return"Instance of '"+A.fN(this)+"'"},
toString(){return this.t(this)}}
A.eT.prototype={
t(a){return""},
$ib_:1}
A.bs.prototype={
gu(a){return this.a.length},
t(a){var s=this.a
return s.charCodeAt(0)==0?s:s},
$imO:1}
A.bc.prototype={$ibc:1}
A.bJ.prototype={$ibJ:1}
A.fd.prototype={
t(a){return String(a)}}
A.h.prototype={$ih:1}
A.aA.prototype={
cp(a,b,c,d){t.y.a(c)
if(c!=null)this.f1(a,b,c,!1)},
f1(a,b,c,d){return a.addEventListener(b,A.bB(t.y.a(c),1),!1)},
hK(a,b,c,d){return a.removeEventListener(b,A.bB(t.y.a(c),1),!1)},
$iaA:1}
A.bK.prototype={$ibK:1}
A.aH.prototype={$iaH:1}
A.aW.prototype={
cp(a,b,c,d){t.y.a(c)
if(b==="message")a.start()
this.eq(a,b,c,!1)},
e0(a,b,c){t.ha.a(c)
if(c!=null){this.he(a,new A.eU([],[]).av(b),c)
return}a.postMessage(new A.eU([],[]).av(b))
return},
iA(a,b){return this.e0(a,b,null)},
he(a,b,c){return a.postMessage(b,t.ew.a(c))},
$iaW:1}
A.b4.prototype={}
A.iU.prototype={}
A.hR.prototype={}
A.cT.prototype={
cr(){var s,r=this,q=r.b
if(q==null)return $.jO()
s=r.d
if(s!=null)J.lP(q,r.c,t.y.a(s),!1)
r.b=null
r.sh1(null)
return $.jO()},
sh1(a){this.d=t.y.a(a)}}
A.hT.prototype={
$1(a){return this.a.$1(t.E.a(a))},
$S:34}
A.ii.prototype={
b0(a){var s,r=this.a,q=r.length
for(s=0;s<q;++s)if(r[s]===a)return s
B.b.v(r,a)
B.b.v(this.b,null)
return q},
av(a){var s,r,q,p=this,o={}
if(a==null)return a
if(A.dc(a))return a
if(typeof a=="number")return a
if(typeof a=="string")return a
if(a instanceof A.bg)return new Date(a.a)
if(t.c8.b(a))return a
if(t.fK.b(a))return a
if(t.bZ.b(a)||t.dD.b(a)||t.bK.b(a))return a
if(t.f.b(a)){s=p.b0(a)
r=p.b
if(!(s<r.length))return A.a(r,s)
q=o.a=r[s]
if(q!=null)return q
q={}
o.a=q
B.b.h(r,s,q)
a.aC(0,new A.ij(o,p))
return o.a}if(t.j.b(a)){s=p.b0(a)
o=p.b
if(!(s<o.length))return A.a(o,s)
q=o[s]
if(q!=null)return q
return p.i4(a,s)}if(t.eH.b(a)){s=p.b0(a)
r=p.b
if(!(s<r.length))return A.a(r,s)
q=o.b=r[s]
if(q!=null)return q
q={}
o.b=q
B.b.h(r,s,q)
p.ik(a,new A.ik(o,p))
return o.b}throw A.d(A.eA("structured clone of other type"))},
i4(a,b){var s,r=J.b9(a),q=r.gu(a),p=new Array(q)
B.b.h(this.b,b,p)
for(s=0;s<q;++s)B.b.h(p,s,this.av(r.m(a,s)))
return p}}
A.ij.prototype={
$2(a,b){this.a.a[a]=this.b.av(b)},
$S:32}
A.ik.prototype={
$2(a,b){this.a.b[a]=this.b.av(b)},
$S:30}
A.hI.prototype={
b0(a){var s,r=this.a,q=r.length
for(s=0;s<q;++s)if(r[s]===a)return s
B.b.v(r,a)
B.b.v(this.b,null)
return q},
av(a){var s,r,q,p,o,n,m,l,k,j=this,i={}
if(a==null)return a
if(A.dc(a))return a
if(typeof a=="number")return a
if(typeof a=="string")return a
if(a instanceof Date){s=a.getTime()
if(Math.abs(s)<=864e13)r=!1
else r=!0
if(r)A.D(A.bE("DateTime is outside valid range: "+s,null))
A.c3(!0,"isUtc",t.v)
return new A.bg(s,!0)}if(a instanceof RegExp)throw A.d(A.eA("structured clone of RegExp"))
if(typeof Promise!="undefined"&&a instanceof Promise)return A.p4(a,t.z)
q=Object.getPrototypeOf(a)
if(q===Object.prototype||q===null){p=j.b0(a)
r=j.b
if(!(p<r.length))return A.a(r,p)
o=i.a=r[p]
if(o!=null)return o
n=t.z
o=A.H(n,n)
i.a=o
B.b.h(r,p,o)
j.ij(a,new A.hJ(i,j))
return i.a}if(a instanceof Array){m=a
p=j.b0(m)
r=j.b
if(!(p<r.length))return A.a(r,p)
o=r[p]
if(o!=null)return o
n=J.b9(m)
l=n.gu(m)
o=j.c?new Array(l):m
B.b.h(r,p,o)
for(r=J.J(o),k=0;k<l;++k)r.h(o,k,j.av(n.m(m,k)))
return o}return a},
dQ(a,b){this.c=!0
return this.av(a)}}
A.hJ.prototype={
$2(a,b){var s=this.a.a,r=this.b.av(b)
J.m(s,a,r)
return r},
$S:25}
A.eU.prototype={
ik(a,b){var s,r,q,p
t.g2.a(b)
for(s=Object.keys(a),r=s.length,q=0;q<r;++q){p=s[q]
b.$2(p,a[p])}}}
A.eH.prototype={
ij(a,b){var s,r,q,p
t.g2.a(b)
for(s=Object.keys(a),r=s.length,q=0;q<s.length;s.length===r||(0,A.di)(s),++q){p=s[q]
b.$2(p,a[p])}}}
A.iO.prototype={
$1(a){return this.a.bQ(this.b.l("0/?").a(a))},
$S:3}
A.iP.prototype={
$1(a){if(a==null)return this.a.dP(new A.fF(a===undefined))
return this.a.dP(a)},
$S:3}
A.fF.prototype={
t(a){return"Promise was rejected with a value of `"+(this.a?"undefined":"null")+"`."}}
A.i6.prototype={
ix(a){if(a<=0||a>4294967296)throw A.d(A.mI("max must be in range 0 < max \u2264 2^32, was "+a))
return Math.random()*a>>>0}}
A.f_.prototype={}
A.dI.prototype={}
A.dH.prototype={
gu(a){var s=this.e
s===$&&A.c("_length")
return s-(this.b-this.c)},
gip(){var s=this.b,r=this.e
r===$&&A.c("_length")
return s>=this.c+r},
q(){var s=this.a,r=this.b++
if(!(r>=0&&r<s.length))return A.a(s,r)
return s[r]},
j(){var s,r,q,p,o=this,n=o.a,m=o.b,l=o.b=m+1,k=n.length
if(!(m>=0&&m<k))return A.a(n,m)
m=n[m]
if(typeof m!=="number")return m.M()
s=m&255
m=o.b=l+1
if(!(l>=0&&l<k))return A.a(n,l)
l=n[l]
if(typeof l!=="number")return l.M()
r=l&255
l=o.b=m+1
if(!(m>=0&&m<k))return A.a(n,m)
m=n[m]
if(typeof m!=="number")return m.M()
q=m&255
o.b=l+1
if(!(l>=0&&l<k))return A.a(n,l)
l=n[l]
if(typeof l!=="number")return l.M()
p=l&255
if(o.d===1)return(s<<24|r<<16|q<<8|p)>>>0
return(p<<24|q<<16|r<<8|s)>>>0}}
A.fK.prototype={}
A.fJ.prototype={
cG(a){var s,r,q,p,o,n=this
t.L.a(a)
s=a.length
for(;r=n.a,q=r+s,p=n.c,o=p.length,q>o;)n.cl(q-o)
B.d.by(p,r,q,a)
n.a+=s},
j3(a){var s,r,q,p,o=this,n=a.c
while(!0){s=o.a
r=a.e
r===$&&A.c("_length")
r=s+(r-(a.b-n))
q=o.c
p=q.length
if(!(r>p))break
o.cl(r-p)}B.d.W(q,s,s+a.gu(a),a.a,a.b)
o.a=o.a+a.gu(a)},
cN(a,b){var s=this
if(a<0)a=s.a+a
if(b==null)b=s.a
else if(b<0)b=s.a+b
return A.N(s.c.buffer,a,b-a)},
N(a){return this.cN(a,null)},
cl(a){var s=a!=null?a>32768?a:32768:32768,r=this.c,q=r.length,p=new Uint8Array((q+s)*2)
B.d.by(p,0,q,r)
this.c=p},
h2(){return this.cl(null)},
gu(a){return this.a}}
A.ir.prototype={
bh(a,b){var s,r,q,p,o=a.q(),n=a.q(),m=o&8
B.a.i(o,3)
if(m!==8)throw A.d(A.iT("Only DEFLATE compression supported: "+m))
if(B.a.P((o<<8>>>0)+n,31)!==0)throw A.d(A.iT("Invalid FCHECK"))
if((n>>>5&1)!==0){a.j()
throw A.d(A.iT("FDICT Encoding not currently supported"))}s=A.bM(B.V)
r=A.bM(B.a6)
q=A.ko(null)
r=new A.dG(a,q,s,r)
r.b=!0
r.di()
p=t.L.a(A.N(q.c.buffer,0,q.a))
a.j()
return p}}
A.fm.prototype={
eE(a){var s,r,q,p,o,n,m,l,k,j,i,h=this,g=a.length
for(s=0;s<g;++s){if(!(s<a.length))return A.a(a,s)
r=a[s]
q=h.b
if(typeof r!=="number")return r.ae()
if(r>q)h.sis(r)
if(!(s<a.length))return A.a(a,s)
r=a[s]
q=h.c
if(typeof r!=="number")return r.eg()
if(r<q)h.siw(r)}p=B.a.H(1,h.b)
h.a=new Uint32Array(p)
for(o=1,n=0,m=2;o<=h.b;){for(r=o<<16,s=0;s<g;++s){if(!(s<a.length))return A.a(a,s)
if(J.aj(a[s],o)){for(l=n,k=0,j=0;j<o;++j){k=(k<<1|l&1)>>>0
l=l>>>1}for(q=h.a,i=(r|s)>>>0,j=k;j<p;j+=m){if(!(j>=0&&j<q.length))return A.a(q,j)
q[j]=i}++n}}++o
n=n<<1>>>0
m=m<<1>>>0}},
sis(a){this.b=A.n(a)},
siw(a){this.c=A.n(a)}}
A.dG.prototype={
di(){var s,r,q,p,o=this
o.e=o.d=0
if(!o.b)return
s=o.a
s===$&&A.c("input")
r=s.c
while(!0){q=s.b
p=s.e
p===$&&A.c("_length")
if(!(q<r+p))break
if(!o.h3())break}},
h3(){var s,r=this,q=r.a
q===$&&A.c("input")
if(q.gip())return!1
s=r.a4(3)
switch(B.a.i(s,1)){case 0:if(r.hd()===-1)return!1
break
case 1:if(r.d4(r.r,r.w)===-1)return!1
break
case 2:if(r.h4()===-1)return!1
break
default:return!1}return(s&1)===0},
a4(a){var s,r,q,p,o=this
if(a===0)return 0
for(s=o.a;r=o.e,r<a;){s===$&&A.c("input")
q=s.b
p=s.e
p===$&&A.c("_length")
if(q>=s.c+p)return-1
p=s.a
s.b=q+1
if(!(q>=0&&q<p.length))return A.a(p,q)
q=p[q]
o.d=(o.d|B.a.H(q,r))>>>0
o.e=r+8}s=o.d
q=B.a.A(1,a)
o.d=B.a.J(s,a)
o.e=r-a
return(s&q-1)>>>0},
cm(a){var s,r,q,p,o,n,m,l=this,k=a.a
k===$&&A.c("table")
s=a.b
for(r=l.a;q=l.e,q<s;){r===$&&A.c("input")
p=r.b
o=r.e
o===$&&A.c("_length")
if(p>=r.c+o)return-1
o=r.a
r.b=p+1
if(!(p>=0&&p<o.length))return A.a(o,p)
p=o[p]
l.d=(l.d|B.a.H(p,q))>>>0
l.e=q+8}r=l.d
p=(r&B.a.H(1,s)-1)>>>0
if(!(p<k.length))return A.a(k,p)
n=k[p]
m=n>>>16
l.d=B.a.J(r,m)
l.e=q-m
return n&65535},
hd(){var s,r,q,p,o,n,m,l=this
l.e=l.d=0
s=l.a4(16)
r=l.a4(16)
if(s!==0&&s!==(r^65535)>>>0)return-1
r=l.a
r===$&&A.c("input")
if(s>r.gu(r))return-1
q=r.c
p=r.b-q+q
if(s<0){o=r.e
o===$&&A.c("_length")
n=o-(p-q)}else n=s
m=A.bO(r.a,r.d,n,p)
r.b=r.b+m.gu(m)
l.c.j3(m)
return 0},
h4(){var s,r,q,p,o,n,m,l,k,j,i=this,h=i.a4(5)
if(h===-1)return-1
h+=257
if(h>288)return-1
s=i.a4(5)
if(s===-1)return-1;++s
if(s>32)return-1
r=i.a4(4)
if(r===-1)return-1
r+=4
if(r>19)return-1
q=new Uint8Array(19)
for(p=0;p<r;++p){o=i.a4(3)
if(o===-1)return-1
n=B.e_[p]
if(!(n<19))return A.a(q,n)
q[n]=o}m=A.bM(q)
n=h+s
l=new Uint8Array(n)
k=A.N(l.buffer,0,h)
j=A.N(l.buffer,h,s)
if(i.fc(n,m,l)===-1)return-1
return i.d4(A.bM(k),A.bM(j))},
d4(a,b){var s,r,q,p,o,n,m,l,k=this
for(s=k.c;!0;){r=k.cm(a)
if(r<0||r>285)return-1
if(r===256)break
if(r<256){if(s.a===s.c.length)s.h2()
q=s.c
p=s.a++
if(!(p>=0&&p<q.length))return A.a(q,p)
q[p]=r&255
continue}o=r-257
if(!(o>=0&&o<29))return A.a(B.ag,o)
n=B.ag[o]+k.a4(B.cW[o])
m=k.cm(b)
if(m<0||m>29)return-1
if(!(m>=0&&m<30))return A.a(B.ab,m)
l=B.ab[m]+k.a4(B.ci[m])
for(q=-l;n>l;){s.cG(s.N(q))
n-=l}if(n===l)s.cG(s.N(q))
else s.cG(s.cN(q,n-l))}for(s=k.a;q=k.e,q>=8;){k.e=q-8
s===$&&A.c("input")
if(--s.b<0)s.b=0}return 0},
fc(a,b,c){var s,r,q,p,o,n,m,l=this
t.L.a(c)
for(s=c.length,r=0,q=0;q<a;){p=l.cm(b)
if(p===-1)return-1
switch(p){case 16:o=l.a4(2)
if(o===-1)return-1
o+=3
for(;n=o-1,o>0;o=n,q=m){m=q+1
if(!(q>=0&&q<s))return A.a(c,q)
c[q]=r}break
case 17:o=l.a4(3)
if(o===-1)return-1
o+=3
for(;n=o-1,o>0;o=n,q=m){m=q+1
if(!(q>=0&&q<s))return A.a(c,q)
c[q]=0}r=0
break
case 18:o=l.a4(7)
if(o===-1)return-1
o+=11
for(;n=o-1,o>0;o=n,q=m){m=q+1
if(!(q>=0&&q<s))return A.a(c,q)
c[q]=0}r=0
break
default:if(p<0||p>15)return-1
m=q+1
if(!(q>=0&&q<s))return A.a(c,q)
c[q]=p
q=m
r=p
break}}return 0}}
A.hH.prototype={}
A.hG.prototype={}
A.bT.prototype={
bW(a,b,c){return this.ef(a,b,c)},
ef(a,b,c){var s=0,r=A.jC(t.z),q,p,o,n,m,l,k,j,i,h,g,f,e,d
var $async$bW=A.jD(function(a0,a1){if(a0===1)return A.jv(a1,r)
while(true)$async$outer:switch(s){case 0:d={}
d.a=null
p=[]
d.b=10
o=new A.h0()
n=A.b([],t.bN)
m=B.a.F(b,13)
l=B.a.F(c,13)
new A.h5(d).$1(a)
for(k=1;k<13;++k)for(j=l*k,i=1;i<13;++i){h=d.a
if(h==null)g=null
else{f=h.x
h=j*h.a+m*i
if(!(h>=0&&h<f.length)){q=A.a(f,h)
s=1
break $async$outer}g=f[h]}B.b.v(n,g)
g.toString
p.push(o.$1(g))}e=new A.h1(d,new A.h6(new A.h3()),new A.h2(new A.h4())).$1(p)
A.eq("Generating palette color from image: "+A.r(e)+" ")
q=e
s=1
break
case 1:return A.jw(q,r)}})
return A.jx($async$bW,r)},
giy(){var s,r=this,q=r.a
if(q===$){s=A.e2([1,new A.h8(r)],t.p,t.eg)
r.a!==$&&A.lr("operations")
r.seU(s)
q=s}return q},
seU(a){this.a=t.dx.a(a)},
$ikR:1}
A.h0.prototype={
$1(a){return(a&4278255360|(a&255)<<16|a>>>16&255)>>>0},
$S:7}
A.h3.prototype={
$1(a){return 0.299*(a&255)+0.587*(B.a.i(a,8)&255)+0.114*(B.a.i(a,16)&255)},
$S:22}
A.h4.prototype={
$4$opacity(a,b,c,d){d=d>1?255:d*255
if(a>255)a=255
if(b>255)b=255
if(c>255)c=255
return A.oY("0x"+B.a.ar(B.a.n(d),16)+B.a.ar(c,16)+B.a.ar(b,16)+B.a.ar(a,16))},
$3(a,b,c){return this.$4$opacity(a,b,c,1)},
$S:23}
A.h2.prototype={
$1(a){var s,r,q,p,o,n,m
for(s=0,r=0,q=0,p=0;o=a.length,p<o;++p){n=A.n(J.lN(a[p],255))
if(!(p<a.length))return A.a(a,p)
o=a[p]
if(typeof o!=="number")return o.X()
s+=n
r+=B.c.i(o,8)&255
q+=B.c.i(o,16)&255}s=B.a.O(s,o)
r=B.a.O(r,o)
q=B.a.O(q,o)
m=this.a.$3(s,r,q)
A.eq("Show #RGBA Color: "+s+" "+r+" "+q+" 255")
A.eq("Convert #RGBA to hex: "+A.r(m))
return m},
$S:49}
A.h5.prototype={
$1(a){return this.a.a=A.oL(t.L.a(a))},
$S:3}
A.h6.prototype={
$1(a){var s,r,q=[]
B.b.an(q,a)
s=A.a4(q)
r=s.l("e(1,1)?").a(new A.h7(this.a))
if(!!q.immutable$list)A.D(A.a_("sort"))
A.mM(q,r,s.c)
A.eq("sorted #argbColor to: "+A.r(q)+" from "+A.r(a))
return q},
$S:20}
A.h7.prototype={
$2(a,b){var s=this.a
return J.lR(s.$1(A.n(b)),s.$1(A.n(a)))},
$S:26}
A.h1.prototype={
$1(a){var s,r,q,p,o,n=[],m=[]
B.b.an(n,this.b.$1(a))
s=this.a
r=s.b=B.aw.ix(s.b)+2
s=n.length
if(r<=s){q=B.a.O(s,r)
for(s=this.c,p=0;p<r;p=o){o=p+1
m.push(s.$1(B.b.a0(n,p*q,o*q)))}}return m},
$S:20}
A.h8.prototype={
$1(a){var s,r
t.gH.a(a)
A.eq("Received getThumbnailCommand in "+A.r(a.x)+" \xb5s")
s=a.e
r=J.J(s)
return this.a.bW(t.D.a(r.m(s,0)),A.n(r.m(s,1)),A.n(r.m(s,2)))},
$S:27}
A.iL.prototype={
$1(a){return new A.bT()},
$S:28}
A.ce.prototype={
ey(a){},
siF(a){this.a=t.hc.a(a)}}
A.c9.prototype={
t(a){return"BitmapCompression."+this.b}}
A.f6.prototype={
e7(){var s,r=this.b
r===$&&A.c("offset")
s=this.a
s===$&&A.c("fileLength")
return A.e2(["offset",r,"fileLength",s,"fileType",19778],t.N,t.p)}}
A.aT.prototype={
gbT(){var s=this.r
if(s!==40)s=s===124&&this.cx===0
else s=!0
return s},
gaD(a){return Math.abs(this.e)},
cP(a,b){var s=this
if(B.b.ah(A.b([1,4,8],t.t),s.x))s.iJ(a)
if(s.r===124){s.ay=a.j()
s.ch=a.j()
s.CW=a.j()
s.cx=a.j()}},
iJ(a){var s=this,r=s.at
if(r===0)r=B.a.A(1,s.x)
s.si_(A.ka(r,new A.f9(s,a,s.r===12?3:4),t.p).cF(0))},
cn(a,b){var s,r,q,p
if(!B.a.gbm(this.e)){s=a.q()
r=a.q()
q=a.q()
p=b==null?a.q():b
return A.aQ(q,r,s,this.gbT()?255:p)}else{q=a.q()
s=a.q()
r=a.q()
p=b==null?a.q():b
return A.aQ(q,s,r,this.gbT()?255:p)}},
dC(a){return this.cn(a,null)},
ia(a,b){var s,r,q,p,o,n=this
t.aR.a(b)
if(n.cy!=null){s=n.x
if(s===4){r=a.q()
q=B.a.i(r,4)
p=r&15
s=n.cy
if(!(q<s.length))return A.a(s,q)
b.$1(s[q])
s=n.cy
if(!(p<s.length))return A.a(s,p)
b.$1(s[p])
return}else if(s===8){r=a.q()
s=n.cy
if(!(r>=0&&r<s.length))return A.a(s,r)
b.$1(s[r])
return}}s=n.y
if(s===B.u&&n.x===32)return b.$1(n.dC(a))
else{o=n.x
if(o===32&&s===B.v)return b.$1(n.dC(a))
else if(o===24)return b.$1(n.cn(a,255))
else throw A.d(A.f("Unsupported bpp ("+o+") or compression ("+s.t(0)+")."))}},
f9(){switch(this.y){case B.u:return"BI_BITFIELDS"
case B.v:return"none"}},
t(a){var s=this
return A.kW(A.e2(["headerSize",s.r,"width",s.f,"height",s.gaD(s),"planes",s.w,"bpp",s.x,"file",s.d.e7(),"compression",s.f9(),"imageSize",s.z,"xppm",s.Q,"yppm",s.as,"totalColors",s.at,"importantColors",s.ax,"readBottomUp",!B.a.gbm(s.e),"v5redMask",A.iC(s.ay),"v5greenMask",A.iC(s.ch),"v5blueMask",A.iC(s.CW),"v5alphaMask",A.iC(s.cx)],t.N,t.K),null," ")},
si_(a){this.cy=t.T.a(a)}}
A.f9.prototype={
$1(a){var s
A.n(a)
s=this.c===3?100:null
return this.a.cn(this.b,s)},
$S:7}
A.dm.prototype={
am(a){var s,r=null
t.L.a(a)
if(!A.f7(A.l(a,!1,r,0)))return r
s=A.l(a,!1,r,0)
this.a=s
return this.b=A.lV(s,r)},
Y(a){var s,r,q,p,o,n,m,l,k,j,i=this,h=i.a
h===$&&A.c("_input")
s=i.b
r=s.d.b
r===$&&A.c("offset")
h.d=r
r=s.f
q=B.a.i(r*s.x,3)
h=B.a.P(q,4)
if(h!==0)q+=4-h
p=A.ak(r,s.gaD(s),B.i)
for(o=p.b-1,h=p.a,n=o;n>=0;--n){s=i.b.e
m=!(s===0?1/s<0:s<0)?n:o-n
s=i.a
l=s.N(q)
s.d=s.d+(l.c-l.d)
k={}
for(k.a=0;k.a<h;j={},j.a=k.a,k=j)i.b.ia(l,new A.f8(k,p,m))}return p},
a5(a){t.L.a(a)
if(!A.f7(A.l(a,!1,null,0)))return null
this.am(a)
return this.Y(0)}}
A.f8.prototype={
$1(a){return this.b.eh(this.a.a++,this.c,a)},
$S:8}
A.fc.prototype={}
A.fa.prototype={}
A.fb.prototype={}
A.dv.prototype={}
A.cm.prototype={
bn(){return this.r},
aa(a,b,c,d,e){throw A.d(A.f("B44 compression not yet supported."))},
b3(a,b,c){return this.aa(a,b,c,null,null)}}
A.dw.prototype={
gj0(a){var s=this.b
s===$&&A.c("type")
return s},
ez(a){var s=this,r=a.bp()
s.a=r
if(r.length===0){s.a=null
return}s.b=a.j()
a.q()
a.d+=3
s.e=a.j()
s.f=a.j()
switch(s.b){case 0:s.c=4
break
case 1:s.c=2
break
case 2:s.c=4
break
default:throw A.d(A.f("EXR Invalid pixel type: "+s.gj0(s)))}}}
A.aB.prototype={
aa(a,b,c,d,e){throw A.d(A.f("Unsupported compression type"))},
b3(a,b,c){return this.aa(a,b,c,null,null)}}
A.dK.prototype={}
A.dx.prototype={
se_(a){this.c=t.T.a(a)}}
A.ff.prototype={
eA(a){var s,r,q,p,o=this,n=A.l(a,!1,null,0)
if(n.j()!==20000630)throw A.d(A.f("File is not an OpenEXR image file."))
s=o.e=n.q()
if(s!==2)throw A.d(A.f("Cannot read version "+s+" image files."))
s=o.f=n.a9()
if((s&4294967289)>>>0!==0)throw A.d(A.f("The file format version number's flag field contains unrecognized flags."))
if((s&16)===0){r=A.k8((s&2)!==0,n)
if(r.f!=null)B.b.v(o.d,r)}else for(s=o.d;!0;){r=A.k8((o.f&2)!==0,n)
if(r.f==null)break
B.b.v(s,r)}s=o.d
q=s.length
if(q===0)throw A.d(A.f("Error reading image header"))
for(p=0;p<s.length;s.length===q||(0,A.di)(s),++p)s[p].iI(n)
o.hy(n)},
hy(a){var s,r,q,p,o,n,m,l,k,j,i,h,g,f=this
for(s=f.d,r=0;r<s.length;++r){q=s[r]
p=q.a
for(o=q.b,n=p.a,m=0;m<o.length;++m){l=o[m]
if(!n.a2(l.a)){k=q.f
k.toString
f.a=k
j=q.r
j.toString
f.b=j
i=l.a
h=l.b
h===$&&A.c("type")
h=h===0?0:3
g=l.c
g===$&&A.c("size")
g=8*g
p.bf(new A.cl(i,k,j,h,g,A.k4(k*j,h,g)))}}if(q.cx)f.hH(r,a)
else f.hG(r,a)}},
hH(c0,c1){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,b0,b1,b2,b3,b4,b5,b6,b7,b8=this,b9=b8.d
if(!(c0<b9.length))return A.a(b9,c0)
s=b9[c0]
b9=b8.f
b9===$&&A.c("flags")
r=(b9&16)!==0
q=s.ay
p=s.at
o=A.i(c1,null,0)
b9=s.b
n=s.a.a
m=0
l=0
while(!0){k=s.go
k.toString
if(!(m<k))break
j=0
while(!0){k=s.fy
k.toString
if(!(j<k))break
k=l!==0
i=0
h=0
while(!0){g=s.fx
if(!(m<g.length))return A.a(g,m)
if(!(i<g[m]))break
f=0
while(!0){g=s.fr
if(!(j<g.length))return A.a(g,j)
if(!(f<g[j]))break
if(k)break
if(!(l>=0&&l<p.length))return A.a(p,l)
g=p[l]
if(!(h>=0&&h<g.length))return A.a(g,h)
o.d=g[h]
if(r)if(o.j()!==c0)throw A.d(A.f("Invalid Image Data"))
e=o.j()
d=o.j()
o.j()
o.j()
c=o.N(o.j())
o.d=o.d+(c.c-c.d)
g=s.db
g.toString
b=d*g
a=s.cy
a.toString
q.toString
a0=b8.a
if(typeof a0!=="number")return A.P(a0)
a0=b8.b
if(typeof a0!=="number")return A.P(a0)
a1=q.aa(c,e*a,b,a,g)
a2=q.a
a3=q.b
a4=a1.length
a5=b9.length
a6=0
a7=0
while(!0){if(a7<a3){g=b8.b
if(typeof g!=="number")return A.P(g)
g=b<g}else g=!1
if(!g)break
for(a8=0;a8<a5;++a8){if(!(a8<b9.length))return A.a(b9,a8)
a9=b9[a8]
g=n.m(0,a9.a).f.buffer
b0=new Uint8Array(g,0)
if(a6>=a4)break
g=s.cy
g.toString
b1=e*g
for(g=a9.c,a=s.f,a0=s.r,b2=b0.length,b3=0;b3<a2;++b3,++b1){g===$&&A.c("size")
b4=0
for(;b4<g;++b4,a6=b6){a.toString
if(b1<a){a0.toString
b5=b<a0}else b5=!1
b6=a6+1
if(b5){b7=(b*a+b1)*g+b4
if(!(a6>=0&&a6<a4))return A.a(a1,a6)
b5=a1[a6]
if(!(b7>=0&&b7<b2))return A.a(b0,b7)
b0[b7]=b5}}}}++a7;++b}++f;++h}++i}++j;++l}++m}},
hG(b2,b3){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,b0,b1=this.d
if(!(b2<b1.length))return A.a(b1,b2)
s=b1[b2]
b1=this.f
b1===$&&A.c("flags")
r=(b1&16)!==0
q=s.ay
b1=s.at
if(0>=b1.length)return A.a(b1,0)
p=b1[0]
o=s.ch
b1=s.b
n=b1.length
m=new Uint32Array(n)
l=A.i(b3,null,0)
for(k=p.length,j=s.a.a,i=q!=null,h=0,g=0;g<k;++g){l.d=p[g]
if(r)if(l.j()!==b2)throw A.d(A.f("Invalid Image Data"))
f=l.j()
e=$.z()
e[0]=f
f=$.M()
if(0>=f.length)return A.a(f,0)
e[0]=l.j()
if(0>=f.length)return A.a(f,0)
d=l.N(f[0])
l.d=l.d+(d.c-d.d)
c=i?q.b3(d,0,h):d.S()
b=c.length
a=b1.length
o.toString
a0=0
while(!0){if(a0<o){f=this.b
if(typeof f!=="number")return A.P(f)
f=h<f}else f=!1
if(!f)break
f=s.CW
if(!(h>=0&&h<f.length))return A.a(f,h)
a1=f[h]
if(a1>=b)break
for(a2=0;a2<a;++a2){if(!(a2<b1.length))return A.a(b1,a2)
a3=b1[a2]
f=j.m(0,a3.a).f.buffer
a4=new Uint8Array(f,0)
if(a1>=b)break
f=s.f
f.toString
e=a3.c
a5=a4.length
a6=0
for(;a6<f;++a6){e===$&&A.c("size")
a7=0
for(;a7<e;++a7,a1=a9){if(!(a2<n))return A.a(m,a2)
a8=m[a2]
if(!(a2<n))return A.a(m,a2)
m[a2]=a8+1
a9=a1+1
if(!(a1>=0&&a1<b))return A.a(c,a1)
b0=c[a1]
if(!(a8<a5))return A.a(a4,a8)
a4[a8]=b0}}}++a0;++h}}}}
A.dy.prototype={
eB(b1,b2,b3){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6,a7,a8=this,a9="dataWindow",b0="Unknown LevelMode format."
for(s=a8.c,r=t.t,q=t.L,p=a8.b;!0;){o=b2.bp()
if(o.length===0)break
b2.bp()
n=b2.N(b2.j())
b2.d=b2.d+(n.c-n.d)
s.h(0,o,new A.dv())
switch(o){case"channels":for(;!0;){m=new A.dw()
m.ez(n)
if(m.a==null)break
B.b.v(p,m)}break
case"chromaticities":l=new Float32Array(8)
a8.Q=l
k=n.j()
j=$.z()
j[0]=k
k=$.bb()
if(0>=k.length)return A.a(k,0)
l[0]=k[0]
l=a8.Q
j[0]=n.j()
l[1]=k[0]
l=a8.Q
j[0]=n.j()
l[2]=k[0]
l=a8.Q
j[0]=n.j()
l[3]=k[0]
l=a8.Q
j[0]=n.j()
l[4]=k[0]
l=a8.Q
j[0]=n.j()
l[5]=k[0]
l=a8.Q
j[0]=n.j()
l[6]=k[0]
l=a8.Q
j[0]=n.j()
l[7]=k[0]
break
case"compression":l=n.a
k=n.d++
if(!(k>=0&&k<l.length))return A.a(l,k)
k=l[k]
a8.as=k
if(k>7)throw A.d(A.f("EXR Invalid compression type"))
break
case"dataWindow":l=n.j()
k=$.z()
k[0]=l
l=$.M()
if(0>=l.length)return A.a(l,0)
j=l[0]
k[0]=n.j()
i=l[0]
k[0]=n.j()
h=l[0]
k[0]=n.j()
a8.seN(q.a(A.b([j,i,h,l[0]],r)))
l=a8.e
l===$&&A.c(a9)
a8.f=l[2]-l[0]+1
a8.r=l[3]-l[1]+1
break
case"displayWindow":l=n.j()
k=$.z()
k[0]=l
l=$.M()
if(0>=l.length)return A.a(l,0)
j=l[0]
k[0]=n.j()
i=l[0]
k[0]=n.j()
h=l[0]
k[0]=n.j()
a8.sic(A.b([j,i,h,l[0]],r))
break
case"lineOrder":break
case"pixelAspectRatio":l=n.j()
$.z()[0]=l
l=$.bb()
if(0>=l.length)return A.a(l,0)
break
case"screenWindowCenter":l=n.j()
k=$.z()
k[0]=l
l=$.bb()
if(0>=l.length)return A.a(l,0)
k[0]=n.j()
break
case"screenWindowWidth":l=n.j()
$.z()[0]=l
l=$.bb()
if(0>=l.length)return A.a(l,0)
break
case"tiles":a8.cy=n.j()
a8.db=n.j()
l=n.a
k=n.d++
if(!(k>=0&&k<l.length))return A.a(l,k)
k=l[k]
a8.dx=k&15
a8.dy=B.a.i(k,4)&15
break
case"type":g=n.bp()
if(g!=="deepscanline")if(g!=="deeptile")throw A.d(A.f("EXR Invalid type: "+g))
break
default:break}}if(a8.cx){s=a8.e
s===$&&A.c(a9)
f=s[0]
e=s[2]
d=s[1]
c=s[3]
switch(a8.dx){case 0:b=1
break
case 1:s=Math.max(e-f+1,c-d+1)
r=a8.dy
A.n(s)
b=(r===0?a8.bG(s):a8.bC(s))+1
break
case 2:a=e-f+1
b=(a8.dy===0?a8.bG(a):a8.bC(a))+1
break
default:A.D(A.f(b0))
b=0}a8.fy=b
s=a8.e
f=s[0]
e=s[2]
d=s[1]
c=s[3]
switch(a8.dx){case 0:b=1
break
case 1:s=Math.max(e-f+1,c-d+1)
r=a8.dy
A.n(s)
b=(r===0?a8.bG(s):a8.bC(s))+1
break
case 2:a0=c-d+1
b=(a8.dy===0?a8.bG(a0):a8.bC(a0))+1
break
default:A.D(A.f(b0))
b=0}a8.go=b
if(a8.dx!==2)a8.go=1
s=a8.fy
s.toString
r=a8.e
a8.sh_(a8.cY(s,r[0],r[2],a8.cy,a8.dy))
r=a8.go
r.toString
s=a8.e
a8.sh0(a8.cY(r,s[1],s[3],a8.db,a8.dy))
s=a8.f7()
a8.id=s
r=a8.cy
r.toString
r=s*r
a8.k1=r
a8.ay=A.k1(a8.as,a8,r,a8.db)
b3.a=b3.b=0
r=a8.fy
r.toString
s=a8.go
s.toString
a8.sdt(A.j4(r*s,new A.fg(b3,a8),!0,t.bv))}else{s=a8.r
s.toString
r=a8.ax=new Uint32Array(s+1)
for(q=p.length,l=a8.e,k=a8.f,a1=0;a1<q;++a1){a2=p[a1]
j=a2.c
j===$&&A.c("size")
k.toString
i=a2.e
i===$&&A.c("xSampling")
a3=B.a.O(j*k,i)
for(j=a2.f,a4=0;a4<s;++a4){l===$&&A.c(a9)
i=l[1]
j===$&&A.c("ySampling")
if(B.a.P(a4+i,j)===0)r[a4]=r[a4]+a3}}for(a5=0,a4=0;a4<s;++a4)a5=Math.max(a5,r[a4])
s=A.k1(a8.as,a8,a5,null)
a8.ay=s
s=a8.ch=s.bn()
r=a8.ax
q=r.length
p=new Uint32Array(q)
a8.CW=p
for(--q,a6=0,a7=0;a7<=q;++a7){if(B.a.P(a7,s)===0)a6=0
p[a7]=a6
a6+=r[a7]}r=a8.r
r.toString
s=B.a.O(r+s,s)
a8.sdt(A.b([new Uint32Array(s-1)],t.hh))}},
bG(a){var s
for(s=0;a>1;){++s
a=B.a.i(a,1)}return s},
bC(a){var s,r
for(s=0,r=0;a>1;){if((a&1)!==0)r=1;++s
a=B.a.i(a,1)}return s+r},
f7(){var s,r,q,p,o
for(s=this.b,r=s.length,q=0,p=0;p<r;++p){o=s[p].c
o===$&&A.c("size")
q+=o}return q},
cY(a,b,c,d,e){var s,r,q,p,o,n,m=J.a9(a,t.p)
for(s=e===1,r=c-b+1,q=0;q<a;++q){p=B.a.A(1,q)
o=B.a.O(r,p)
if(s&&o*p<r)++o
n=Math.max(o,1)
d.toString
m[q]=B.a.O(n+d-1,d)}return m},
sic(a){t.T.a(a)},
seN(a){this.e=t.L.a(a)},
sdt(a){this.at=t.gZ.a(a)},
sh_(a){this.fr=t.k.a(a)},
sh0(a){this.fx=t.k.a(a)}}
A.fg.prototype={
$1(a){var s,r,q,p,o=this.b,n=o.fr,m=this.a,l=m.b
if(!(l<n.length))return A.a(n,l)
n=n[l]
s=o.fx
r=m.a
if(!(r<s.length))return A.a(s,r)
s=s[r]
q=new Uint32Array(n*s)
p=l+1
m.b=p
if(p===o.fy){m.b=0
m.a=r+1}return q},
$S:48}
A.cn.prototype={
iI(a){var s,r,q,p,o,n=this
if(n.cx)for(s=0;s<n.at.length;++s){r=0
while(!0){q=n.at
if(!(s<q.length))return A.a(q,s)
q=q[s]
if(!(r<q.length))break
q[r]=a.cB();++r}}else{q=n.at
if(0>=q.length)return A.a(q,0)
p=q[0].length
for(s=0;s<p;++s){q=n.at
if(0>=q.length)return A.a(q,0)
q=q[0]
o=a.cB()
if(!(s<q.length))return A.a(q,s)
q[s]=o}}}}
A.dL.prototype={
eF(a,b,c){var s,r,q,p=this,o=a.b.length,n=J.a9(o,t.eO)
for(s=0;s<o;++s)n[s]=new A.d3()
p.seO(t.q.a(n))
r=p.w
r.toString
q=B.a.F(r*p.x,2)
p.z=new Uint16Array(q)},
bn(){return this.x},
aa(a8,a9,b0,b1,b2){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5=this,a6="_channelData",a7="size"
if(b1==null)b1=a5.c.f
if(b2==null)b2=a5.c.ch
b1.toString
s=a9+b1-1
b2.toString
r=b0+b2-1
q=a5.c
p=q.f
p.toString
if(s>p)s=p-1
p=q.r
p.toString
if(r>p)r=p-1
a5.a=s-a9+1
a5.b=r-b0+1
o=q.b
n=o.length
for(m=0,l=0;l<n;++l){k=o[l]
q=a5.y
q===$&&A.c(a6)
if(!(l<q.length))return A.a(q,l)
j=q[l]
j.b=j.a=m
q=k.e
q===$&&A.c("xSampling")
i=B.a.O(a9,q)
h=B.a.O(s,q)
q=i*q<a9?0:1
q=h-i+q
j.c=q
p=k.f
p===$&&A.c("ySampling")
i=B.a.O(b0,p)
h=B.a.O(r,p)
g=i*p<b0?0:1
g=h-i+g
j.d=g
j.e=p
p=k.c
p===$&&A.c(a7)
p=p/2|0
j.f=p
m+=q*g*p}f=a8.k()
e=a8.k()
if(e>=8192)throw A.d(A.f("Error in header for PIZ-compressed data (invalid bitmap size)."))
d=new Uint8Array(8192)
if(f<=e){c=a8.V(e-f+1)
for(q=c.d,b=c.c-q,p=c.a,g=p.length,a=f,l=0;l<b;++l,a=a0){a0=a+1
a1=q+l
if(!(a1>=0&&a1<g))return A.a(p,a1)
a1=p[a1]
if(!(a<8192))return A.a(d,a)
d[a]=a1}}a2=new Uint16Array(65536)
a3=a5.hM(d,a2)
A.mb(a8,a8.j(),a5.z,m)
for(l=0;l<n;++l){q=a5.y
q===$&&A.c(a6)
if(!(l<q.length))return A.a(q,l)
j=q[l]
a=0
while(!0){q=j.f
q===$&&A.c(a7)
if(!(a<q))break
p=a5.z
p.toString
g=j.a
g===$&&A.c("start")
a1=j.c
a1===$&&A.c("nx")
a4=j.d
a4===$&&A.c("ny")
A.me(p,g+a,a1,q,a4,a1*q,a3);++a}}q=a5.z
q.toString
a5.f2(a2,q,m)
q=a5.r
if(q==null){q=a5.w
q.toString
q=a5.r=A.fI(q*a5.x+73728)}q.a=0
for(;b0<=r;++b0)for(l=0;l<n;++l){q=a5.y
q===$&&A.c(a6)
if(!(l<q.length))return A.a(q,l)
j=q[l]
q=j.e
q===$&&A.c("ys")
if(B.a.P(b0,q)!==0)continue
q=j.c
q===$&&A.c("nx")
p=j.f
p===$&&A.c(a7)
a9=q*p
for(;a9>0;--a9){q=a5.r
q.toString
p=a5.z
p.toString
g=j.b
g===$&&A.c("end")
j.b=g+1
if(!(g>=0&&g<p.length))return A.a(p,g)
q.ee(p[g])}}q=a5.r
return A.N(q.c.buffer,0,q.a)},
b3(a,b,c){return this.aa(a,b,c,null,null)},
f2(a,b,c){var s,r,q=t.L
q.a(a)
q.a(b)
for(q=b.length,s=0;s<c;++s){if(!(s<q))return A.a(b,s)
r=b[s]
if(!(r>=0&&r<65536))return A.a(a,r)
b[s]=a[r]}},
hM(a,b){var s,r,q,p,o
for(s=0,r=0;r<65536;++r){if(r!==0){q=r>>>3
if(!(q<8192))return A.a(a,q)
q=(a[q]&1<<(r&7))>>>0!==0}else q=!0
if(q){p=s+1
if(!(s<65536))return A.a(b,s)
b[s]=r
s=p}}for(p=s;p<65536;p=o){o=p+1
if(!(p<65536))return A.a(b,p)
b[p]=0}return s-1},
seO(a){this.y=t.q.a(a)}}
A.d3.prototype={}
A.dM.prototype={
bn(){return this.x},
aa(a4,a5,a6,a7,a8){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1=this,a2=B.r.bh(A.bO(t.L.a(a4.S()),1,null,0),!1),a3=a1.y
if(a3==null){a3=a1.w
a3.toString
a3=a1.y=A.fI(a1.x*a3)}a3.a=0
s=A.b([0,0,0,0],t.t)
r=new Uint32Array(1)
q=A.N(r.buffer,0,null)
if(a7==null)a7=a1.c.f
if(a8==null)a8=a1.c.ch
a7.toString
p=a5+a7-1
a8.toString
o=a6+a8-1
a3=a1.c
n=a3.f
n.toString
if(p>n)p=n-1
n=a3.r
n.toString
if(o>n)o=n-1
a1.a=p-a5+1
a1.b=o-a6+1
a3=a3.b
m=a3.length
for(n=q.length,l=a2.length,k=a6,j=0;k<=o;++k)for(i=0;i<m;++i){if(!(i<a3.length))return A.a(a3,i)
h=a3[i]
g=h.f
g===$&&A.c("ySampling")
if(B.a.P(a6,g)!==0)continue
g=h.e
g===$&&A.c("xSampling")
f=B.a.O(a5,g)
e=B.a.O(p,g)
g=f*g<a5?0:1
d=e-f+g
if(0>=1)return A.a(r,0)
r[0]=0
g=h.b
g===$&&A.c("type")
switch(g){case 0:B.b.h(s,0,j)
B.b.h(s,1,s[0]+d)
B.b.h(s,2,s[1]+d)
j=s[2]+d
for(c=0;c<d;++c){g=s[0]
B.b.h(s,0,g+1)
if(!(g>=0&&g<l))return A.a(a2,g)
g=a2[g]
b=s[1]
B.b.h(s,1,b+1)
if(!(b>=0&&b<l))return A.a(a2,b)
b=a2[b]
a=s[2]
B.b.h(s,2,a+1)
if(!(a>=0&&a<l))return A.a(a2,a)
a=a2[a]
r[0]=r[0]+((g<<24|b<<16|a<<8)>>>0)
for(a0=0;a0<4;++a0){g=a1.y
g.toString
if(!(a0<n))return A.a(q,a0)
g.ad(q[a0])}}break
case 1:B.b.h(s,0,j)
B.b.h(s,1,s[0]+d)
j=s[1]+d
for(c=0;c<d;++c){g=s[0]
B.b.h(s,0,g+1)
if(!(g>=0&&g<l))return A.a(a2,g)
g=a2[g]
b=s[1]
B.b.h(s,1,b+1)
if(!(b>=0&&b<l))return A.a(a2,b)
b=a2[b]
r[0]=r[0]+((g<<8|b)>>>0)
for(a0=0;a0<2;++a0){g=a1.y
g.toString
if(!(a0<n))return A.a(q,a0)
g.ad(q[a0])}}break
case 2:B.b.h(s,0,j)
B.b.h(s,1,s[0]+d)
B.b.h(s,2,s[1]+d)
j=s[2]+d
for(c=0;c<d;++c){g=s[0]
B.b.h(s,0,g+1)
if(!(g>=0&&g<l))return A.a(a2,g)
g=a2[g]
b=s[1]
B.b.h(s,1,b+1)
if(!(b>=0&&b<l))return A.a(a2,b)
b=a2[b]
a=s[2]
B.b.h(s,2,a+1)
if(!(a>=0&&a<l))return A.a(a2,a)
a=a2[a]
r[0]=r[0]+((g<<24|b<<16|a<<8)>>>0)
for(a0=0;a0<4;++a0){g=a1.y
g.toString
if(!(a0<n))return A.a(q,a0)
g.ad(q[a0])}}break}}a3=a1.y
return A.N(a3.c.buffer,0,a3.a)},
b3(a,b,c){return this.aa(a,b,c,null,null)}}
A.dN.prototype={
bn(){return 1},
aa(a0,a1,a2,a3,a4){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c=this,b=a0.c,a=A.fI((b-a0.d)*2)
if(a3==null)a3=c.c.f
if(a4==null)a4=c.c.ch
a3.toString
s=a1+a3-1
a4.toString
r=a2+a4-1
q=c.c
p=q.f
p.toString
if(s>p)s=p-1
q=q.r
q.toString
if(r>q)r=q-1
c.a=s-a1+1
c.b=r-a2+1
for(;q=a0.d,q<b;){p=a0.a
a0.d=q+1
if(!(q>=0&&q<p.length))return A.a(p,q)
q=p[q]
$.W()[0]=q
q=$.a3()
if(0>=q.length)return A.a(q,0)
o=q[0]
if(o<0){n=-o
for(;m=n-1,n>0;n=m){q=a0.a
p=a0.d++
if(!(p>=0&&p<q.length))return A.a(q,p)
a.ad(q[p])}}else for(n=o;m=n-1,n>=0;n=m){q=a0.a
p=a0.d++
if(!(p>=0&&p<q.length))return A.a(q,p)
a.ad(q[p])}}l=A.N(a.c.buffer,0,a.a)
for(k=l.length,j=1;j<k;++j)l[j]=l[j-1]+l[j]-128
b=c.r
if(b==null||b.length!==k)b=c.r=new Uint8Array(k)
q=B.a.F(k+1,2)
for(i=0,h=0;!0;q=d,i=f){if(h<k){b.toString
g=h+1
f=i+1
if(!(i<k))return A.a(l,i)
p=l[i]
e=b.length
if(!(h<e))return A.a(b,h)
b[h]=p}else break
if(g<k){h=g+1
d=q+1
if(!(q<k))return A.a(l,q)
q=l[q]
if(!(g<e))return A.a(b,g)
b[g]=q}else break}b.toString
return b},
b3(a,b,c){return this.aa(a,b,c,null,null)}}
A.co.prototype={
bn(){return this.w},
aa(a,b,c,d,a0){var s,r,q,p,o,n,m,l,k,j,i,h,g,f=this,e=B.r.bh(A.bO(t.L.a(a.S()),1,null,0),!1)
if(d==null)d=f.c.f
if(a0==null)a0=f.c.ch
d.toString
s=b+d-1
a0.toString
r=c+a0-1
q=f.c
p=q.f
p.toString
if(s>p)s=p-1
q=q.r
q.toString
if(r>q)r=q-1
f.a=s-b+1
f.b=r-c+1
for(o=e.length,n=1;n<o;++n)e[n]=e[n-1]+e[n]-128
q=f.x
if(q==null||q.length!==o)q=f.x=new Uint8Array(o)
p=B.a.F(o+1,2)
for(m=0,l=0;!0;p=g,m=j){if(l<o){q.toString
k=l+1
j=m+1
if(!(m<o))return A.a(e,m)
i=e[m]
h=q.length
if(!(l<h))return A.a(q,l)
q[l]=i}else break
if(k<o){l=k+1
g=p+1
if(!(p<o))return A.a(e,p)
p=e[p]
if(!(k<h))return A.a(q,k)
q[k]=p}else break}q.toString
return q},
b3(a,b,c){return this.aa(a,b,c,null,null)}}
A.fe.prototype={
Y(a){var s=this.a
if(s==null)return null
s=s.d
if(!(a<s.length))return A.a(s,a)
return A.oU(s[a].a,1)},
a5(a){var s
t.L.a(a)
s=new A.ff(A.b([],t.dd))
s.eA(a)
this.a=s
return this.Y(0)}}
A.fi.prototype={
cJ(a,b,c,d){var s,r=a*3,q=this.d,p=q.length
if(!(r<p))return A.a(q,r)
q[r]=b
s=r+1
if(!(s<p))return A.a(q,s)
q[s]=c
s=r+2
if(!(s<p))return A.a(q,s)
q[s]=d}}
A.ck.prototype={
eC(a){var s,r,q,p,o,n,m,l,k=this
k.a=a.k()
k.b=a.k()
k.c=a.k()
k.d=a.k()
s=a.q()
k.e=(s&64)!==0
if((s&128)!==0){k.f=A.k3(B.a.A(1,(s&7)+1))
for(r=0;q=k.f,r<q.b;++r){p=a.a
o=a.d
n=a.d=o+1
m=p.length
if(!(o>=0&&o<m))return A.a(p,o)
o=p[o]
l=a.d=n+1
if(!(n>=0&&n<m))return A.a(p,n)
n=p[n]
a.d=l+1
if(!(l>=0&&l<m))return A.a(p,l)
q.cJ(r,o,n,p[l])}}k.x=a.d-a.b}}
A.dO.prototype={}
A.dA.prototype={}
A.fj.prototype={
am(a){var s,r,q,p,o,n,m,l,k,j,i=this
i.b=A.l(t.L.a(a),!1,null,0)
i.a=new A.dA(A.b([],t.U))
if(!i.dc())return null
try{for(;o=i.b,n=o.d,n<o.c;){m=o.a
l=o.d=n+1
k=m.length
if(!(n>=0&&n<k))return A.a(m,n)
s=m[n]
switch(s){case 44:r=i.dF()
if(r==null){o=i.a
return o}B.b.v(i.a.r,r)
break
case 33:o.d=l+1
if(!(l>=0&&l<k))return A.a(m,l)
q=m[l]
if(J.aj(q,255)){o=i.b
n=o.a
m=o.d++
if(!(m>=0&&m<n.length))return A.a(n,m)
if(o.L(n[m])==="NETSCAPE2.0"){n=o.a
m=o.d
l=o.d=m+1
k=n.length
if(!(m>=0&&m<k))return A.a(n,m)
m=n[m]
o.d=l+1
if(!(l>=0&&l<k))return A.a(n,l)
l=n[l]
if(m===3&&l===1)o.k()}else i.bM()}else if(J.aj(q,249)){o=i.b
o.toString
i.hu(o)}else i.bM()
break
case 59:o=i.a
return o
default:break}}}catch(j){p=A.a1(j)
A.jH(p)}return i.a},
hu(a){var s,r,q,p,o
a.q()
s=a.q()
a.k()
r=a.q()
a.q()
B.a.i(s,2)
q=a.aT(1,0)
p=q.a
q=q.d
if(!(q>=0&&q<p.length))return A.a(p,q)
if(p[q]===44){++a.d
o=this.dF()
if(o==null)return
if((s&1)!==0){q=o.f
if(q!=null)q.c=r
else{q=this.a.e
if(q!=null)q.c=r}}B.b.v(this.a.r,o)}},
Y(a){var s,r,q,p=this,o=p.b
if(o==null||p.a==null)return null
s=p.a.r
r=s.length
if(a>=r||!1)return null
if(!(a<r))return A.a(s,a)
q=s[a]
o.toString
s=q.x
s===$&&A.c("_inputPosition")
o.d=s
return p.fp(q)},
a5(a){if(this.am(t.L.a(a))==null)return null
return this.Y(0)},
dF(){var s,r=this.b
if(r.d>=r.c)return null
s=new A.dO()
s.eC(r);++this.b.d
this.bM()
return s},
fp(a){var s,r,q,p,o,n,m,l,k,j,i,h=this
if(h.d==null){h.d=new Uint8Array(256)
h.e=new Uint8Array(4095)
h.f=new Uint8Array(4096)
h.r=new Uint32Array(4096)}s=h.w=h.b.q()
r=B.a.H(1,s)
h.cx=r;++r
h.CW=r
h.ch=r+1;++s
h.ay=s
h.ax=B.a.H(1,s)
h.Q=0
h.at=4098
h.y=h.z=0
h.d[0]=0
s=h.r
s.toString
B.q.a6(s,0,4096,4098)
s=a.c
s===$&&A.c("width")
r=a.d
r===$&&A.c("height")
q=a.a
q===$&&A.c("x")
p=h.a
o=p.a
if(typeof o!=="number")return A.P(o)
if(q+s<=o){q=a.b
q===$&&A.c("y")
o=p.b
if(typeof o!=="number")return A.P(o)
o=q+r>o
q=o}else q=!0
if(q)return null
n=a.f
n=n!=null?n:p.e
h.x=s*r
m=A.ak(s,r,B.i)
l=new Uint8Array(s)
s=a.e
s===$&&A.c("interlaced")
if(s){s=a.b
s===$&&A.c("y")
for(r=s+r,k=0,j=0;k<4;++k)for(i=s+B.aP[k];i<r;i+=B.bc[k],++j){if(!h.dd(l))return m
h.dK(m,i,n,l)}}else for(i=0;i<r;++i){if(!h.dd(l))return m
h.dK(m,i,n,l)}return m},
dK(a,b,c,d){var s,r,q,p,o,n,m,l,k,j,i,h,g,f
if(c!=null)for(s=d.length,r=c.d,q=r.length,p=a.x,o=b*a.a,n=p.length,m=0;m<s;++m){l=d[m]
k=l*3
j=l===c.c?0:255
if(!(k<q))return A.a(r,k)
l=r[k]
i=k+1
if(!(i<q))return A.a(r,i)
i=r[i]
h=k+2
if(!(h<q))return A.a(r,h)
h=r[h]
g=B.c.n(B.a.p(j,0,255))
h=B.c.n(B.a.p(h,0,255))
i=B.c.n(B.a.p(i,0,255))
l=B.c.n(B.a.p(l,0,255))
f=o+m
if(!(f>=0&&f<n))return A.a(p,f)
p[f]=(g<<24|h<<16|i<<8|l)>>>0}},
dc(){var s,r,q,p,o,n,m,l,k,j=this,i=j.b.L(6)
if(i!=="GIF87a"&&i!=="GIF89a")return!1
s=j.a
s.toString
s.a=j.b.k()
s=j.a
s.toString
s.b=j.b.k()
r=j.b.q()
j.a.toString
j.b.q();++j.b.d
if((r&128)!==0){s=j.a
s.toString
s.e=A.k3(B.a.A(1,(r&7)+1))
for(q=0;s=j.a.e,q<s.b;++q){p=j.b
o=p.a
n=p.d
m=p.d=n+1
l=o.length
if(!(n>=0&&n<l))return A.a(o,n)
n=o[n]
k=p.d=m+1
if(!(m>=0&&m<l))return A.a(o,m)
m=o[m]
p.d=k+1
if(!(k>=0&&k<l))return A.a(o,k)
s.cJ(q,n,m,o[k])}}j.a.toString
return!0},
dd(a){var s=this,r=s.x
r.toString
s.x=r-a.length
if(!s.fw(a))return!1
if(s.x===0)s.bM()
return!0},
bM(){var s,r,q,p=this.b
if(p.d>=p.c)return!0
s=p.q()
while(!0){if(s!==0){p=this.b
p=p.d<p.c}else p=!1
if(!p)break
p=this.b
r=p.d+=s
if(r>=p.c)return!0
q=p.a
p.d=r+1
if(!(r>=0&&r<q.length))return A.a(q,r)
s=q[r]}return!0},
fw(a){var s,r,q,p,o,n,m,l,k,j,i,h=this,g="_stack",f="_suffix",e=h.Q
if(e>4095)return!1
s=a.length
if(e!==0){r=0
while(!0){if(!(e!==0&&r<s))break
q=r+1
p=h.e
p===$&&A.c(g)
e=h.Q=e-1
if(!(e>=0))return A.a(p,e)
p=p[e]
if(!(r<s))return A.a(a,r)
a[r]=p
r=q}}else r=0
for(;r<s;){o=h.as=h.fv()
if(o==null)return!1
e=h.CW
if(o===e)return!1
p=h.cx
if(o===p){for(p=h.r,n=0;n<=4095;++n)p[n]=4098
h.ch=e+1
e=h.w+1
h.ay=e
h.ax=B.a.H(1,e)
h.at=4098}else{if(o<p){q=r+1
if(!(r>=0))return A.a(a,r)
a[r]=o
r=q}else{e=h.r
e.toString
if(o>>>0!==o||o>=4096)return A.a(e,o)
if(e[o]===4098){m=h.ch-2
if(o===m){o=h.at
l=h.f
l===$&&A.c(f)
k=h.e
k===$&&A.c(g)
j=h.Q++
p=h.cf(e,o,p)
if(!(j>=0&&j<4095))return A.a(k,j)
k[j]=p
if(!(m>=0&&m<4096))return A.a(l,m)
l[m]=p}else return!1}n=0
while(!0){i=n+1
if(!(n<=4095&&o>h.cx&&o<=4095))break
e=h.e
e===$&&A.c(g)
p=h.Q++
m=h.f
m===$&&A.c(f)
if(!(o>=0&&o<4096))return A.a(m,o)
m=m[o]
if(!(p>=0&&p<4095))return A.a(e,p)
e[p]=m
m=h.r
m.toString
if(!(o<4096))return A.a(m,o)
o=m[o]
n=i}if(i>=4095||o>4095)return!1
e=h.e
e===$&&A.c(g)
p=h.Q++
if(!(p>=0&&p<4095))return A.a(e,p)
e[p]=o
while(!0){e=h.Q
if(!(e!==0&&r<s))break
q=r+1
p=h.e;--e
h.Q=e
if(!(e>=0&&e<4095))return A.a(p,e)
e=p[e]
if(!(r>=0&&r<s))return A.a(a,r)
a[r]=e
r=q}}e=h.at
if(e!==4098){p=h.r
p.toString
m=h.ch-2
if(!(m>=0&&m<4096))return A.a(p,m)
m=p[m]===4098
p=m}else p=!1
if(p){p=h.r
p.toString
m=h.ch-2
if(!(m>=0&&m<4096))return A.a(p,m)
p[m]=e
l=h.as
k=h.f
j=h.cx
if(l===m){k===$&&A.c(f)
k[m]=h.cf(p,e,j)}else{k===$&&A.c(f)
l.toString
k[m]=h.cf(p,l,j)}}e=h.as
e.toString
h.at=e}}return!0},
fv(){var s,r,q,p,o=this
if(o.ay>12)return null
for(;s=o.z,r=o.ay,s<r;){s=o.f4()
s.toString
r=o.y
q=o.z
o.y=(r|B.a.H(s,q))>>>0
o.z=q+8}q=o.y
if(!(r>=0&&r<13))return A.a(B.a4,r)
p=B.a4[r]
o.y=B.a.J(q,r)
o.z=s-r
s=o.ch
if(s<4097){++s
o.ch=s
s=s>o.ax&&r<12}else s=!1
if(s){o.ax=o.ax<<1>>>0
o.ay=r+1}return q&p},
cf(a,b,c){var s,r,q=0
while(!0){if(b>c){s=q+1
r=q<=4095
q=s}else r=!1
if(!r)break
if(b>4095)return 4098
a.toString
if(!(b>=0))return A.a(a,b)
b=a[b]}return b},
f4(){var s,r,q=this,p=q.d,o=p[0]
if(o===0){p[0]=q.b.q()
p=q.d
o=p[0]
if(o===0)return null
B.d.by(p,1,1+o,q.b.V(o).S())
p=q.d
s=p[1]
p[1]=2
p[0]=p[0]-1}else{r=p[1]
p[1]=r+1
if(!(r<256))return A.a(p,r)
s=p[r]
p[0]=o-1}return s}}
A.fn.prototype={
Y(b4){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,b0,b1,b2=null,b3=this.a
if(b3!=null){s=this.b
s=s==null||b4>=s.e}else s=!0
if(s)return b2
s=this.b.f
if(!(b4<s.length))return A.a(s,b4)
r=s[b4]
s=b3.a
b3=b3.b+r.e
q=r.d
p=J.iS(s,b3,b3+q)
o=new A.ed()
if(o.b1(p))return o.a5(p)
n=A.fI(14)
n.ee(19778)
n.bV(q)
n.bV(0)
n.bV(0)
b3=A.l(p,!1,b2,0)
s=A.jU(A.l(A.N(n.c.buffer,0,n.a),!1,b2,0))
q=b3.j()
m=b3.j()
l=$.z()
l[0]=m
m=$.M()
if(0>=m.length)return A.a(m,0)
k=m[0]
l[0]=b3.j()
j=m[0]
i=b3.k()
h=b3.k()
g=b3.j()
f=A.e2([0,B.v,3,B.u],t.p,t.G).m(0,g)
if(f==null)A.D(A.f("Bitmap compression "+g+" is not supported yet."))
g=b3.j()
l[0]=b3.j()
e=m[0]
l[0]=b3.j()
m=m[0]
l=b3.j()
d=new A.dD(s,j,k,q,i,h,f,g,e,m,l,b3.j())
d.cP(b3,s)
if(q!==40&&i!==1)return b2
c=l===0&&h<=8?40+4*B.a.A(1,h):40+4*l
s.b=c
n.a-=4
n.bV(c)
b=A.l(p,!1,b2,0)
a=new A.fc()
a.a=b
a.b=d
a0=a.Y(0)
if(h>=32)return a0
a1=32-B.a.P(k,32)
a2=B.a.F(a1===32?k:k+a1,8)
for(b3=a0.x,s=a0.a,q=b3.length,m=a0.b-1,l=1/j<0,i=j<0,j=j===0,a3=0;a3<B.a.F(A.aT.prototype.gaD.call(d,d),2);++a3){a4=!(j?l:i)?a3:m-a3
a5=b.N(a2)
b.d=b.d+(a5.c-a5.d)
for(h=a4*s,a6=0;a6<k;){g=a5.a
e=a5.d++
if(!(e>=0&&e<g.length))return A.a(g,e)
e=g[e]
a7=7
while(!0){if(!(a7>-1&&a6<k))break
if((e&B.a.H(1,a7))>>>0!==0){g=h+a6
a8=B.c.n(B.a.p(0,0,255))
a9=B.c.n(B.a.p(0,0,255))
b0=B.c.n(B.a.p(0,0,255))
b1=B.c.n(B.a.p(0,0,255))
if(!(g>=0&&g<q))return A.a(b3,g)
b3[g]=(a8<<24|a9<<16|b0<<8|b1)>>>0}++a6;--a7}}}return a0},
a5(a){var s=A.l(t.L.a(a),!1,null,0)
this.a=s
s=A.k6(s)
this.b=s
if(s==null)return null
return this.Y(0)}}
A.fo.prototype={}
A.fp.prototype={
$1(a){var s
A.n(a)
s=this.a
s.q()
s.q()
s.q();++s.d
s.k()
s.k()
return new A.bN(s.j(),s.j())},
$S:31}
A.bN.prototype={}
A.dD.prototype={
gaD(a){return B.a.F(A.aT.prototype.gaD.call(this,this),2)},
gbT(){return this.r===40&&this.x===32?!1:A.aT.prototype.gbT.call(this)}}
A.dr.prototype={}
A.fu.prototype={}
A.am.prototype={
seP(a){this.r=t.h0.a(a)}}
A.fv.prototype={
j2(a){var s,r,q,p,o,n,m,l=this,k=A.l(t.L.a(a),!0,null,0)
l.a=k
s=k.aT(2,0)
k=s.a
r=s.d
q=k.length
if(!(r>=0&&r<q))return A.a(k,r)
if(k[r]===255){++r
if(!(r<q))return A.a(k,r)
r=k[r]!==216
k=r}else k=!0
if(k)return!1
if(l.aY()!==216)return!1
p=l.aY()
o=!1
n=!1
while(!0){if(p!==217){k=l.a
k=k.d<k.c}else k=!1
if(!k)break
m=l.a.k()
if(m<2)break
k=l.a
k.d=k.d+(m-2)
switch(p){case 192:case 193:case 194:o=!0
break
case 218:n=!0
break}p=l.aY()}return o&&n},
iG(a){var s,r,q,p,o,n,m,l,k=this
k.a=A.l(t.L.a(a),!0,null,0)
k.hl()
if(k.x.length!==1)throw A.d(A.f("Only single frame JPEGs supported"))
for(s=k.Q,r=0;q=k.d,p=q.z,r<p.length;++r){o=q.y.m(0,p[r])
q=o.a
p=k.d
n=p.f
m=o.b
l=p.r
p=k.f5(p,o)
q=q===1&&n===2?1:0
B.b.v(s,new A.dr(p,q,m===1&&l===2?1:0))}},
hl(){var s,r,q,p,o,n,m,l,k=this
if(k.aY()!==216)throw A.d(A.f("Start Of Image marker not found."))
s=k.aY()
while(!0){if(s!==217){r=k.a
r===$&&A.c("input")
r=r.d<r.c}else r=!1
if(!r)break
r=k.a
r===$&&A.c("input")
q=r.k()
if(q<2)A.D(A.f("Invalid Block"))
r=k.a
p=r.N(q-2)
r.d=r.d+(p.c-p.d)
switch(s){case 224:case 225:case 226:case 227:case 228:case 229:case 230:case 231:case 232:case 233:case 234:case 235:case 236:case 237:case 238:case 239:case 254:k.hm(s,p)
break
case 219:k.ho(p)
break
case 192:case 193:case 194:k.ht(s,p)
break
case 195:case 197:case 198:case 199:case 200:case 201:case 202:case 203:case 205:case 206:case 207:throw A.d(A.f("Unhandled frame type "+B.a.ar(s,16)))
case 196:k.hn(p)
break
case 221:k.e=p.k()
break
case 218:k.hF(p)
break
case 255:r=k.a
o=r.a
n=r.d
if(!(n>=0&&n<o.length))return A.a(o,n)
if(o[n]!==255)r.d=n-1
break
default:r=k.a
o=r.a
n=r.d
m=n+-3
l=o.length
if(!(m>=0&&m<l))return A.a(o,m)
if(o[m]===255){m=n+-2
if(!(m>=0&&m<l))return A.a(o,m)
m=o[m]
o=m>=192&&m<=254}else o=!1
if(o){r.d=n-3
break}if(s!==0)throw A.d(A.f("Unknown JPEG marker "+B.a.ar(s,16)))
break}s=k.aY()}},
aY(){var s,r=this,q=r.a
q===$&&A.c("input")
if(q.d>=q.c)return 0
do{do{s=r.a.q()
if(s!==255){q=r.a
q=q.d<q.c}else q=!1}while(q)
q=r.a
if(q.d>=q.c)return s
do{s=r.a.q()
if(s===255){q=r.a
q=q.d<q.c}else q=!1}while(q)
if(s===0){q=r.a
q=q.d<q.c}else q=!1}while(q)
return s},
hr(a,b,c){var s,r,q,p,o,n,m=a.c,l=m-a.d
try{switch(b){case 6:o=a.q()
$.W()[0]=o
o=$.a3()
if(0>=o.length)return A.a(o,0)
o=o[0]
return o
case 1:case 7:o=a.q()
return o
case 2:o=a.L(1)
return o
case 3:o=a.k()
return o
case 4:o=a.j()
return o
case 5:case 10:s=a.aT(8,c)
o=s.j()
n=$.z()
n[0]=o
o=$.M()
if(0>=o.length)return A.a(o,0)
r=o[0]
n[0]=s.j()
if(0>=o.length)return A.a(o,0)
q=o[0]
if(J.aj(q,0))return 0
o=r
n=q
if(typeof o!=="number")return o.j5()
if(typeof n!=="number")return A.P(n)
return o/n
case 8:o=a.k()
$.a2()[0]=o
o=$.a7()
if(0>=o.length)return A.a(o,0)
o=o[0]
return o
case 9:o=a.j()
$.z()[0]=o
o=$.M()
if(0>=o.length)return A.a(o,0)
o=o[0]
return o
case 11:o=a.j()
$.z()[0]=o
o=$.bb()
if(0>=o.length)return A.a(o,0)
o=o[0]
return o
case 12:o=a.aT(8,c).bU()
return o
default:return 0}}finally{o=l
n=a.d
if(typeof o!=="number")return o.el()
p=o-(m-n)
m=p
if(typeof m!=="number")return m.eg()
if(m<4){m=p
if(typeof m!=="number")return A.P(m)
a.d=n+A.n(4-m)}}},
hq(a){var s,r,q,p,o,n,m,l,k=a.k()
for(s=this.r.b,r=a.c,q=0;q<k;++q){p=a.k()
o=a.k()
n=a.j()
if(o-1>=12)continue
if(n>65536)continue
if(!(o<13))return A.a(B.ac,o)
m=B.ac[o]
if(m>4){l=a.j()
if(l+m>r-a.d)continue}else l=0
s.h(0,p,this.hr(a,o,l))}},
hp(a){var s,r,q,p,o=this.r
if(o.a==null)o.siF(A.b([],t.gN))
s=B.d.em(a.S(),0)
o=o.a
o.toString
B.b.v(o,s)
if(a.j()!==1165519206)return
if(a.k()!==0)return
r=a.e
q=a.L(2)
if(q==="II")a.e=!1
else if(q==="MM")a.e=!0
else return
a.d+=2
p=a.j()
if(p<8||p>16)if(p>a.c-a.d-16){a.e=r
return}if(p>8)a.d+=p-8
this.hq(a)
a.e=r},
hm(a,b){var s,r,q,p,o,n=b
if(a===224){s=n
r=s.a
s=s.d
if(!(s>=0&&s<r.length))return A.a(r,s)
if(r[s]===74){s=n
r=s.a
s=s.d+1
if(!(s>=0&&s<r.length))return A.a(r,s)
if(r[s]===70){s=n
r=s.a
s=s.d+2
if(!(s>=0&&s<r.length))return A.a(r,s)
if(r[s]===73){s=n
r=s.a
s=s.d+3
if(!(s>=0&&s<r.length))return A.a(r,s)
if(r[s]===70){s=n
r=s.a
s=s.d+4
if(!(s>=0&&s<r.length))return A.a(r,s)
s=r[s]===0}else s=!1}else s=!1}else s=!1}else s=!1
if(s){s=this.b=new A.fx()
r=n
q=r.a
r=r.d+5
if(!(r>=0&&r<q.length))return A.a(q,r)
q=n
r=q.a
q=q.d+6
if(!(q>=0&&q<r.length))return A.a(r,q)
r=n
q=r.a
r=r.d+7
if(!(r>=0&&r<q.length))return A.a(q,r)
q=n
r=q.a
q=q.d+8
if(!(q>=0&&q<r.length))return A.a(r,q)
r=n
q=r.a
r=r.d+9
if(!(r>=0&&r<q.length))return A.a(q,r)
q=n
r=q.a
q=q.d+10
if(!(q>=0&&q<r.length))return A.a(r,q)
r=n
q=r.a
r=r.d+11
if(!(r>=0&&r<q.length))return A.a(q,r)
q=n
r=q.a
q=q.d+12
if(!(q>=0&&q<r.length))return A.a(r,q)
q=r[q]
s.f=q
r=n
p=r.a
r=r.d+13
if(!(r>=0&&r<p.length))return A.a(p,r)
r=p[r]
s.r=r
n.aT(14+3*q*r,14)}}else if(a===225)this.hp(n)
else if(a===238){s=n
r=s.a
s=s.d
if(!(s>=0&&s<r.length))return A.a(r,s)
if(r[s]===65){s=n
r=s.a
s=s.d+1
if(!(s>=0&&s<r.length))return A.a(r,s)
if(r[s]===100){s=n
r=s.a
s=s.d+2
if(!(s>=0&&s<r.length))return A.a(r,s)
if(r[s]===111){s=n
r=s.a
s=s.d+3
if(!(s>=0&&s<r.length))return A.a(r,s)
if(r[s]===98){s=n
r=s.a
s=s.d+4
if(!(s>=0&&s<r.length))return A.a(r,s)
if(r[s]===101){s=n
r=s.a
s=s.d+5
if(!(s>=0&&s<r.length))return A.a(r,s)
s=r[s]===0}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1
if(s){s=new A.fu()
this.c=s
r=n
q=r.a
r=r.d+6
if(!(r>=0&&r<q.length))return A.a(q,r)
q=n
r=q.a
q=q.d+7
if(!(q>=0&&q<r.length))return A.a(r,q)
r=n
q=r.a
r=r.d+8
if(!(r>=0&&r<q.length))return A.a(q,r)
q=n
r=q.a
q=q.d+9
if(!(q>=0&&q<r.length))return A.a(r,q)
r=n
q=r.a
r=r.d+10
if(!(r>=0&&r<q.length))return A.a(q,r)
q=n
r=q.a
q=q.d+11
if(!(q>=0&&q<r.length))return A.a(r,q)
s.d=r[q]}}else if(a===254)try{n.iL()}catch(o){A.af(o)}},
ho(a){var s,r,q,p,o,n,m,l,k,j
for(s=a.c,r=this.w;q=a.d,p=q<s,p;){p=a.a
a.d=q+1
if(!(q>=0&&q<p.length))return A.a(p,q)
q=p[q]
o=B.a.i(q,4)
n=q&15
if(n>=4)throw A.d(A.f("Invalid number of quantization tables"))
if(r[n]==null)B.b.h(r,n,new Int16Array(64))
m=r[n]
for(q=o!==0,l=0;l<64;++l){if(q)k=a.k()
else{p=a.a
j=a.d++
if(!(j>=0&&j<p.length))return A.a(p,j)
k=p[j]}m.toString
p=B.m[l]
if(!(p<64))return A.a(m,p)
m[p]=k}}if(p)throw A.d(A.f("Bad length for DQT block"))},
ht(a,b){var s,r,q,p,o,n,m,l,k,j=this
if(j.d!=null)throw A.d(A.f("Duplicate JPG frame data found."))
s=j.d=new A.dV(A.H(t.p,t.d2),A.b([],t.t))
s.b=a===194
s.c=b.q()
s=j.d
s.toString
s.d=b.k()
s=j.d
s.toString
s.e=b.k()
r=b.q()
for(s=j.w,q=0;q<r;++q){p=b.a
o=b.d
n=b.d=o+1
m=p.length
if(!(o>=0&&o<m))return A.a(p,o)
o=p[o]
l=b.d=n+1
if(!(n>=0&&n<m))return A.a(p,n)
n=p[n]
k=B.a.i(n,4)
b.d=l+1
if(!(l>=0&&l<m))return A.a(p,l)
l=p[l]
B.b.v(j.d.z,o)
j.d.y.h(0,o,new A.am(k&15,n&15,s,l))}j.d.iC()
B.b.v(j.x,j.d)},
hn(a){var s,r,q,p,o,n,m,l,k,j,i,h
for(s=a.c,r=this.z,q=this.y;p=a.d,p<s;){o=a.a
n=p+1
a.d=n
if(!(p>=0&&p<o.length))return A.a(o,p)
m=o[p]
l=new Uint8Array(16)
for(p=n,k=0,j=0;j<16;++j,p=n){n=p+1
a.d=n
if(!(p>=0&&p<o.length))return A.a(o,p)
p=o[p]
if(!(j<16))return A.a(l,j)
l[j]=p
k+=l[j]}i=new Uint8Array(k)
for(j=0;j<k;++j,p=n){n=p+1
a.d=n
if(!(p>=0&&p<o.length))return A.a(o,p)
p=o[p]
if(!(j<k))return A.a(i,j)
i[j]=p}if((m&16)!==0){m-=16
h=q}else h=r
if(h.length<=m)B.b.su(h,m+1)
B.b.h(h,m,this.f6(l,i))}},
hF(a){var s,r,q,p,o,n,m,l=this,k=a.q()
if(k<1||k>4)throw A.d(A.f("Invalid SOS block"))
s=A.j4(k,new A.fw(l,a),!0,t.d2)
r=a.q()
q=a.q()
p=a.q()
o=B.a.i(p,4)
n=l.a
n===$&&A.c("input")
m=l.d
o=new A.dW(n,m,s,l.e,r,q,o&15,p&15)
n=m.w
n===$&&A.c("mcusPerLine")
o.f=n
o.r=m.b
o.ap()},
f6(a,b){var s,r,q,p,o,n,m,l,k,j,i=A.b([],t.e8),h=16
while(!0){if(!(h>0&&a[h-1]===0))break;--h}B.b.v(i,new A.bZ([]))
if(0>=i.length)return A.a(i,0)
s=i[0]
for(r=b.length,q=0,p=0;p<h;){for(o=0;o<a[p];++o){if(0>=i.length)return A.a(i,-1)
s=i.pop()
n=s.a
m=n.length
l=s.b
if(m<=l)B.b.su(n,l+1)
m=s.b
if(!(q>=0&&q<r))return A.a(b,q)
B.b.h(n,m,b[q])
for(;n=s.b,n>0;){if(0>=i.length)return A.a(i,-1)
s=i.pop()}s.b=n+1
B.b.v(i,s)
for(;i.length<=p;s=k){n=[]
k=new A.bZ(n)
B.b.v(i,k)
m=s.a
l=m.length
j=s.b
if(l<=j)B.b.su(m,j+1)
B.b.h(m,s.b,n)}++q}++p
if(p<h){n=[]
k=new A.bZ(n)
B.b.v(i,k)
m=s.a
l=m.length
j=s.b
if(l<=j)B.b.su(m,j+1)
B.b.h(m,s.b,n)
s=k}}if(0>=i.length)return A.a(i,0)
return i[0].a},
f5(a3,a4){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2=a4.e
a2===$&&A.c("blocksPerLine")
s=a4.f
s===$&&A.c("blocksPerColumn")
r=a2<<3>>>0
q=new Int32Array(64)
p=new Uint8Array(64)
o=s*8
n=A.U(o,null,!1,t.aD)
for(m=a4.c,l=a4.d,k=0,j=0;j<s;++j){i=j<<3>>>0
for(h=0;h<8;++h,k=g){g=k+1
B.b.h(n,k,new Uint8Array(r))}for(f=0;f<a2;++f){if(!(l>=0&&l<4))return A.a(m,l)
e=m[l]
e.toString
d=a4.r
d===$&&A.c("blocks")
if(!(j<d.length))return A.a(d,j)
d=d[j]
if(!(f<d.length))return A.a(d,f)
A.p5(e,d[f],p,q)
c=f<<3>>>0
for(b=0,a=0;a<8;++a){e=i+a
if(!(e<o))return A.a(n,e)
a0=n[e]
for(h=0;h<8;++h,b=a1){a0.toString
e=c+h
a1=b+1
if(!(b>=0&&b<64))return A.a(p,b)
d=p[b]
if(!(e<a0.length))return A.a(a0,e)
a0[e]=d}}}}return n}}
A.fw.prototype={
$1(a){var s,r,q,p,o,n=this.b,m=n.q(),l=n.q()
n=this.a
if(!n.d.y.a2(m))throw A.d(A.f("Invalid Component in SOS block"))
s=n.d.y.m(0,m)
s.toString
r=B.a.i(l,4)&15
q=l&15
p=n.z
o=p.length
if(r<o){if(!(r<o))return A.a(p,r)
p=p[r]
p.toString
s.w=p}n=n.y
p=n.length
if(q<p){if(!(q<p))return A.a(n,q)
n=n[q]
n.toString
s.x=n}return s},
$S:41}
A.bZ.prototype={}
A.dV.prototype={
iC(){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a=this
for(s=a.y,r=A.y(s).c,q=A.fB(s,s.r,r);q.B();){p=s.m(0,q.d)
a.sit(Math.max(a.f,p.a))
a.siu(Math.max(a.r,p.b))}q=a.e
q.toString
a.w=B.c.b_(q/8/a.f)
q=a.d
q.toString
a.x=B.c.b_(q/8/a.r)
for(r=A.fB(s,s.r,r),q=t.h0,o=t.an,n=t.f0;r.B();){m=s.m(0,r.d)
m.toString
l=a.e
l.toString
k=m.a
j=B.c.b_(B.c.b_(l/8)*k/a.f)
l=a.d
l.toString
i=m.b
h=B.c.b_(B.c.b_(l/8)*i/a.r)
g=a.w*k
f=a.x*i
e=J.a9(f,n)
for(d=0;d<f;++d){c=J.a9(g,o)
for(b=0;b<g;++b)c[b]=new Int32Array(64)
e[d]=c}m.e=j
m.f=h
m.seP(q.a(e))}},
sit(a){this.f=A.n(a)},
siu(a){this.r=A.n(a)}}
A.fx.prototype={}
A.dW.prototype={
ap(){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0=this,a1="blocksPerLine",a2=a0.y,a3=a2.length,a4=a0.r
a4.toString
if(a4)if(a0.Q===0)s=a0.at===0?a0.gfl():a0.gfn()
else s=a0.at===0?a0.gfd():a0.gff()
else s=a0.gfi()
a4=a3===1
if(a4){if(0>=a3)return A.a(a2,0)
r=a2[0]
q=r.e
q===$&&A.c(a1)
r=r.f
r===$&&A.c("blocksPerColumn")
p=q*r}else{r=a0.f
r===$&&A.c("mcusPerLine")
q=a0.b.x
q===$&&A.c("mcusPerColumn")
p=r*q}r=a0.z
if(r==null||r===0)a0.z=p
for(r=a0.a,q=t.m,o=0;o<p;){for(n=0;n<a3;++n){if(!(n<a2.length))return A.a(a2,n)
a2[n].y=0}a0.CW=0
if(a4){if(0>=a2.length)return A.a(a2,0)
m=a2[0]
l=0
while(!0){k=a0.z
k.toString
if(!(l<k))break
q.a(s)
k=m.e
k===$&&A.c(a1)
j=B.a.O(o,k)
i=B.a.P(o,k)
k=m.r
k===$&&A.c("blocks")
if(!(j>=0&&j<k.length))return A.a(k,j)
k=k[j]
if(!(i>=0&&i<k.length))return A.a(k,i)
s.$2(m,k[i]);++o;++l}}else{l=0
while(!0){k=a0.z
k.toString
if(!(l<k))break
for(n=0;n<a3;++n){if(!(n<a2.length))return A.a(a2,n)
m=a2[n]
h=m.a
g=m.b
for(f=0;f<g;++f)for(e=0;e<h;++e)a0.fq(m,s,o,f,e)}++o;++l}}a0.ch=0
k=r.a
d=r.d
c=k.length
if(!(d>=0&&d<c))return A.a(k,d)
b=k[d]
a=d+1
if(!(a<c))return A.a(k,a)
a=k[a]
if(b===255)if(a>=208&&a<=215)r.d=d+2
else break}},
aM(){var s,r,q=this,p=q.ch
if(p>0){--p
q.ch=p
return B.a.X(q.ay,p)&1}p=q.a
if(p.d>=p.c)return null
s=p.q()
q.ay=s
if(s===255){r=p.q()
if(r!==0)throw A.d(A.f("unexpected marker: "+B.a.ar((q.ay<<8|r)>>>0,16)))}q.ch=7
return B.a.i(q.ay,7)&1},
bc(a){var s,r,q
for(s=t.j,r=a;q=this.aM(),q!=null;){r=J.lO(s.a(r),q)
if(typeof r=="number")return B.c.n(r)}return null},
co(a){var s,r
for(s=0;a>0;){r=this.aM()
if(r==null)return null
s=(s<<1|r)>>>0;--a}return s},
be(a){var s
if(a===1)return this.aM()===1?1:-1
a.toString
s=this.co(a)
s.toString
if(s>=B.a.H(1,a-1))return s
return s+B.a.H(-1,a)+1},
fj(a,b){var s,r,q,p,o,n,m=this,l=a.w
l===$&&A.c("huffmanTableDC")
s=m.bc(l)
r=s===0?0:m.be(s)
l=a.y
l===$&&A.c("pred")
l+=r
a.y=l
b[0]=l
for(q=1;q<64;){l=a.x
l===$&&A.c("huffmanTableAC")
l=m.bc(l)
l.toString
p=l&15
o=B.a.i(l,4)
if(p===0){if(o<15)break
q+=16
continue}q+=o
p=m.be(p)
if(!(q>=0&&q<80))return A.a(B.m,q)
n=B.m[q]
if(!(n<64))return A.a(b,n)
b[n]=p;++q}},
fm(a,b){var s,r,q=a.w
q===$&&A.c("huffmanTableDC")
s=this.bc(q)
r=s===0?0:B.a.A(this.be(s),this.ax)
q=a.y
q===$&&A.c("pred")
q+=r
a.y=q
b[0]=q},
fo(a,b){var s,r
t.L.a(b)
s=b[0]
r=this.aM()
r.toString
b[0]=(s|B.a.A(r,this.ax))>>>0},
fe(a,b){var s,r,q,p,o,n,m,l=this,k=l.CW
if(k>0){l.CW=k-1
return}s=l.Q
r=l.as
for(k=l.ax;s<=r;){q=a.x
q===$&&A.c("huffmanTableAC")
q=l.bc(q)
q.toString
p=q&15
o=B.a.i(q,4)
if(p===0){if(o<15){k=l.co(o)
k.toString
l.CW=k+B.a.A(1,o)-1
break}s+=16
continue}s+=o
if(!(s>=0&&s<80))return A.a(B.m,s)
n=B.m[s]
q=l.be(p)
m=B.a.A(1,k)
if(!(n<64))return A.a(b,n)
b[n]=q*m;++s}},
fg(a,b){var s,r,q,p,o,n,m,l,k,j=this
t.L.a(b)
s=j.Q
r=j.as
for(q=j.ax,p=0;s<=r;){if(!(s>=0&&s<80))return A.a(B.m,s)
o=B.m[s]
n=j.cx
switch(n){case 0:n=a.x
n===$&&A.c("huffmanTableAC")
m=j.bc(n)
if(m==null)throw A.d(A.f("Invalid progressive encoding"))
l=m&15
p=B.a.i(m,4)
if(l===0)if(p<15){n=j.co(p)
n.toString
j.CW=n+B.a.A(1,p)
j.cx=4}else{j.cx=1
p=16}else{if(l!==1)throw A.d(A.f("invalid ACn encoding"))
j.cy=j.be(l)
j.cx=p!==0?2:3}continue
case 1:case 2:if(!(o<64))return A.a(b,o)
k=b[o]
if(k!==0){n=j.aM()
n.toString
n=B.a.A(n,q)
if(!(o<64))return A.a(b,o)
b[o]=k+n}else{--p
if(p===0)j.cx=n===2?3:0}break
case 3:if(!(o<64))return A.a(b,o)
n=b[o]
if(n!==0){k=j.aM()
k.toString
k=B.a.A(k,q)
if(!(o<64))return A.a(b,o)
b[o]=n+k}else{n=j.cy
n===$&&A.c("successiveACNextValue")
n=B.a.A(n,q)
if(!(o<64))return A.a(b,o)
b[o]=n
j.cx=0}break
case 4:if(!(o<64))return A.a(b,o)
n=b[o]
if(n!==0){k=j.aM()
k.toString
k=B.a.A(k,q)
if(!(o<64))return A.a(b,o)
b[o]=n+k}break}++s}if(j.cx===4)if(--j.CW===0)j.cx=0},
fq(a,b,c,d,e){var s,r,q,p,o
t.m.a(b)
s=this.f
s===$&&A.c("mcusPerLine")
r=B.a.O(c,s)*a.b+d
q=B.a.P(c,s)*a.a+e
s=a.r
s===$&&A.c("blocks")
p=s.length
if(r>=p)return
if(!(r>=0))return A.a(s,r)
s=s[r]
o=s.length
if(q>=o)return
if(!(q>=0))return A.a(s,q)
b.$2(a,s[q])}}
A.dU.prototype={
a5(a){var s
t.L.a(a)
s=A.kg()
s.iG(a)
if(s.x.length!==1)throw A.d(A.f("only single frame JPEGs supported"))
return A.oO(s)}}
A.cC.prototype={}
A.dP.prototype={}
A.fM.prototype={
siz(a){this.x=t.k.a(a)},
siZ(a){this.y=t.T.a(a)},
shY(a){this.z=t.k.a(a)}}
A.dQ.prototype={}
A.ed.prototype={
b1(a){var s,r,q,p,o,n=A.l(t.L.a(a),!0,null,0).V(8)
for(s=n.a,r=n.d,q=s.length,p=0;p<8;++p){o=r+p
if(!(o>=0&&o<q))return A.a(s,o)
if(s[o]!==B.W[p])return!1}return!0},
am(b1){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6,a7=this,a8=null,a9=t.L,b0=A.l(a9.a(b1),!0,a8,0)
a7.d=b0
s=b0.V(8)
for(b0=s.a,r=s.d,q=b0.length,p=0;p<8;++p){o=r+p
if(!(o>=0&&o<q))return A.a(b0,o)
if(b0[o]!==B.W[p])return a8}for(b0=t.t,r=t.N,q=t.dm;!0;){o=a7.d
n=o.d-o.b
m=o.j()
l=a7.d.L(4)
switch(l){case"tEXt":if(a7.a==null)a7.a=new A.dQ(A.H(r,r),A.b([],q),A.b([],b0))
o=a7.d
k=o.N(m)
o.d=o.d+(k.c-k.d)
j=k.S()
for(i=j.length,p=0;p<i;++p)if(j[p]===0){h=B.T.bS(new Uint8Array(j.subarray(0,A.av(0,p,i))))
o=p+1
g=B.T.bS(new Uint8Array(j.subarray(o,A.av(o,a8,i))))
a7.a.ch.h(0,h,g)
break}a7.d.d+=4
break
case"IHDR":o=a7.d
k=o.N(m)
o.d=o.d+(k.c-k.d)
f=A.i(k,a8,0)
e=f.S()
o=new A.dQ(A.H(r,r),A.b([],q),A.b([],b0))
a7.a=o
o.a=f.j()
o=a7.a
o.toString
o.b=f.j()
o=a7.a
o.toString
d=f.a
c=f.d
b=f.d=c+1
a=d.length
if(!(c>=0&&c<a))return A.a(d,c)
o.d=d[c]
c=f.d=b+1
if(!(b>=0&&b<a))return A.a(d,b)
o.e=d[b]
b=f.d=c+1
if(!(c>=0&&c<a))return A.a(d,c)
c=f.d=b+1
if(!(b>=0&&b<a))return A.a(d,b)
o.r=d[b]
f.d=c+1
if(!(c>=0&&c<a))return A.a(d,c)
o.w=d[c]
if(!B.b.ah(A.b([0,2,3,4,6],b0),a7.a.e))return a8
o=a7.a
if(o.r!==0)return a8
switch(o.e){case 0:if(!B.b.ah(A.b([1,2,4,8,16],b0),a7.a.d))return a8
break
case 2:if(!B.b.ah(A.b([8,16],b0),a7.a.d))return a8
break
case 3:if(!B.b.ah(A.b([1,2,4,8],b0),a7.a.d))return a8
break
case 4:if(!B.b.ah(A.b([8,16],b0),a7.a.d))return a8
break
case 6:if(!B.b.ah(A.b([8,16],b0),a7.a.d))return a8
break}if(a7.d.j()!==A.bC(a9.a(e),A.bC(new A.be(l),0)))throw A.d(A.f("Invalid "+l+" checksum"))
break
case"PLTE":o=a7.a
o.toString
d=a7.d
k=d.N(m)
d.d=d.d+(k.c-k.d)
o.siz(k.S())
if(a7.d.j()!==A.bC(a9.a(a9.a(a7.a.x)),A.bC(new A.be(l),0)))throw A.d(A.f("Invalid "+l+" checksum"))
break
case"tRNS":o=a7.a
o.toString
d=a7.d
k=d.N(m)
d.d=d.d+(k.c-k.d)
o.siZ(k.S())
a0=a7.d.j()
o=a7.a.y
o.toString
if(a0!==A.bC(a9.a(o),A.bC(new A.be(l),0)))throw A.d(A.f("Invalid "+l+" checksum"))
break
case"IEND":a7.d.d+=4
break
case"gAMA":if(m!==4)throw A.d(A.f("Invalid gAMA chunk"))
a1=a7.d.j()
a7.d.d+=4
if(a1!==1e5)a7.a.Q=a1/1e5
break
case"IDAT":B.b.v(a7.a.db,n)
o=a7.d
d=o.d+=m
o.d=d+4
break
case"acTL":a7.a.toString
a7.d.j()
a7.a.toString
a7.d.j()
a7.d.d+=4
break
case"fcTL":a2=new A.dP(A.b([],b0))
B.b.v(a7.a.cy,a2)
a7.d.j()
a2.b=a7.d.j()
a2.c=a7.d.j()
a7.d.j()
a7.d.j()
a7.d.k()
a7.d.k()
o=a7.d
d=o.a
c=o.d
b=o.d=c+1
a=d.length
if(!(c>=0&&c<a))return A.a(d,c)
c=b+1
o.d=c
if(!(b>=0&&b<a))return A.a(d,b)
o.d=c+4
break
case"fdAT":a7.d.j()
B.b.v(B.b.giq(a7.a.cy).y,n)
o=a7.d
d=o.d+=m-4
o.d=d+4
break
case"bKGD":o=a7.a
d=o.e
if(d===3){d=a7.d
c=d.a
d=d.d++
if(!(d>=0&&d<c.length))return A.a(c,d);--m
a3=c[d]*3
o=o.x
d=o.length
if(!(a3>=0&&a3<d))return A.a(o,a3)
a4=o[a3]
c=a3+1
if(!(c<d))return A.a(o,c)
a5=o[c]
c=a3+2
if(!(c<d))return A.a(o,c)
a6=o[c]
B.c.n(B.a.p(255,0,255))
B.c.n(B.a.p(a6,0,255))
B.c.n(B.a.p(a5,0,255))
B.c.n(B.a.p(a4,0,255))}else if(d===0||d===4){a7.d.k()
m-=2}else if(d===2||d===6){a7.d.k()
a7.d.k()
a7.d.k()
m-=24}if(m>0)a7.d.d+=m
a7.d.d+=4
break
case"iCCP":o=a7.a
o.toString
o.at=a7.d.bp()
o=a7.a
o.toString
d=a7.d
c=d.a
b=d.d++
if(!(b>=0&&b<c.length))return A.a(c,b)
k=d.N(m-(o.at.length+2))
d.d=d.d+(k.c-k.d)
d=a7.a
d.toString
d.ay=k.S()
a7.d.d+=4
break
default:o=a7.d
d=o.d+=m
o.d=d+4
break}if(l==="IEND")break
o=a7.d
if(o.d>=o.c)return a8}return a7.a},
Y(a1){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0=this
if(a0.a==null)return null
s=A.b([],t.t)
r=a0.a
q=r.a
p=r.b
o=r.cy
n=o.length
if(n===0||a1===0)for(m=r.db.length,r=t.L,l=0;l<m;++l){o=a0.d
o===$&&A.c("_input")
n=a0.a.db
if(!(l<n.length))return A.a(n,l)
o.d=n[l]
k=o.j()
j=a0.d.L(4)
o=a0.d
i=o.N(k)
o.d=o.d+(i.c-i.d)
h=i.S()
B.b.an(s,h)
if(a0.d.j()!==A.bC(r.a(h),A.bC(new A.be(j),0)))throw A.d(A.f("Invalid "+j+" checksum"))}else{if(a1>=n)throw A.d(A.f("Invalid Frame Number: "+a1))
if(!(a1<n))return A.a(o,a1)
g=o[a1]
q=g.b
p=g.c
for(r=g.y,l=0;l<r.length;++l){o=a0.d
o===$&&A.c("_input")
o.d=r[l]
k=o.j()
a0.d.L(4)
o=a0.d
o.d+=4
i=o.N(k)
o.d=o.d+(i.c-i.d)
B.b.an(s,i.S())}}r=a0.a
o=r.e
f=o===4||o===6||r.y!=null?B.i:B.G
q.toString
p.toString
e=A.ak(q,p,f)
d=A.l(B.r.bh(A.bO(t.L.a(s),1,null,0),!1),!0,null,0)
a0.c=a0.b=0
r=a0.a
if(r.z==null){r.shY(A.j4(256,new A.fL(),!1,t.p))
r=a0.a
o=r.x
if(o!=null&&r.Q!=null)for(n=o.length,r=r.z,l=0;l<n;++l){r.toString
c=o[l]
if(!(c<256))return A.a(r,c)
o[l]=r[c]}}r=a0.a
b=r.a
a=r.b
r.a=q
r.b=p
a0.e=0
if(r.w!==0){r=B.a.i(q+7,3)
o=B.a.i(p+7,3)
a0.aL(d,e,0,0,8,8,r,o)
r=q+3
a0.aL(d,e,4,0,8,8,B.a.i(r,3),o)
o=p+3
a0.aL(d,e,0,4,4,8,B.a.i(r,2),B.a.i(o,3))
r=q+1
a0.aL(d,e,2,0,4,4,B.a.i(r,2),B.a.i(o,2))
o=p+1
a0.aL(d,e,0,2,2,4,B.a.i(r,1),B.a.i(o,2))
a0.aL(d,e,1,0,2,2,B.a.i(q,1),B.a.i(o,1))
a0.aL(d,e,0,1,1,2,q,B.a.i(p,1))}else a0.hg(d,e)
r=a0.a
r.a=b
r.b=a
r=r.ch
if(r.a!==0)e.hU(r)
return e},
a5(a){if(this.am(t.L.a(a))==null)return null
return this.Y(0)},
aL(b1,b2,b3,b4,b5,b6,b7,b8){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6,a7,a8=this,a9=a8.a,b0=a9.e
if(b0===4)s=2
else if(b0===2)s=3
else{b0=b0===6?4:1
s=b0}a9=a9.d
a9.toString
r=s*a9
q=B.a.i(r+7,3)
p=B.a.i(r*b7+7,3)
o=A.U(p,0,!1,t.p)
n=A.b([o,o],t.S)
m=A.b([0,0,0,0],t.t)
for(a9=b2.x,b0=b2.a,l=a9.length,k=b5>1,j=b2.b,i=b5-b3,h=i<=1,g=b4,f=0,e=0;f<b8;++f,g+=b6,++a8.e){d=b1.a
c=b1.d++
if(!(c>=0&&c<d.length))return A.a(d,c)
c=d[c]
b=b1.N(p)
b1.d=b1.d+(b.c-b.d)
B.b.h(n,e,b.S())
if(!(e>=0&&e<2))return A.a(n,e)
a=n[e]
e=1-e
a8.dI(c,q,a,n[e])
a8.c=a8.b=0
d=a.length
a0=new A.Y(a,0,d,0,!0)
for(d=g*b0,a1=b3,a2=0;a2<b7;++a2,a1+=b5){a8.dB(a0,m)
a3=a8.d8(m)
c=d+a1
if(!(c>=0&&c<l))return A.a(a9,c)
a9[c]=a3
if(!h||k)for(a4=0;a4<b5;++a4)for(a5=0;a5<i;++a5){c=a1+a5
a6=g+a5
if(c<b0)a7=a6<j
else a7=!1
if(a7){c=a6*b0+c
if(!(c>=0&&c<l))return A.a(a9,c)
a9[c]=a3}}}}},
hg(a3,a4){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0=this,a1=a0.a,a2=a1.e
if(a2===4)s=2
else if(a2===2)s=3
else{a2=a2===6?4:1
s=a2}a2=a1.d
a2.toString
r=s*a2
q=a1.a
p=a1.b
o=B.a.i(q*r+7,3)
n=B.a.i(r+7,3)
m=A.U(o,0,!1,t.p)
l=A.b([m,m],t.S)
k=A.b([0,0,0,0],t.t)
for(a1=a4.x,a2=a1.length,j=0,i=0,h=0;j<p;++j,h=d){g=a3.a
f=a3.d++
if(!(f>=0&&f<g.length))return A.a(g,f)
f=g[f]
e=a3.N(o)
a3.d=a3.d+(e.c-e.d)
B.b.h(l,h,e.S())
if(!(h>=0&&h<2))return A.a(l,h)
d=1-h
a0.dI(f,n,l[h],l[d])
a0.c=a0.b=0
f=l[h]
g=f.length
c=new A.Y(f,0,g,0,!0)
for(b=0;b<q;++b,i=a){a0.dB(c,k)
a=i+1
g=a0.d8(k)
if(!(i>=0&&i<a2))return A.a(a1,i)
a1[i]=g}}},
dI(a,b,c,d){var s,r,q,p,o,n,m,l,k,j,i,h,g,f=t.L
f.a(c)
f.a(d)
s=c.length
switch(a){case 0:break
case 1:for(f=J.J(c),r=b;r<s;++r){q=c.length
if(!(r<q))return A.a(c,r)
p=c[r]
o=r-b
if(!(o>=0&&o<q))return A.a(c,o)
o=c[o]
if(typeof p!=="number")return p.b4()
if(typeof o!=="number")return A.P(o)
f.h(c,r,p+o&255)}break
case 2:for(f=J.J(c),r=0;r<s;++r){if(!(r<c.length))return A.a(c,r)
q=c[r]
if(!(r<d.length))return A.a(d,r)
p=d[r]
if(typeof q!=="number")return q.b4()
if(typeof p!=="number")return A.P(p)
f.h(c,r,q+p&255)}break
case 3:for(f=J.J(c),r=0;r<s;++r){if(r<b)n=0
else{q=r-b
if(!(q>=0&&q<c.length))return A.a(c,q)
n=c[q]}if(!(r<d.length))return A.a(d,r)
m=d[r]
if(!(r<c.length))return A.a(c,r)
q=c[r]
p=B.a.i(n+m,1)
if(typeof q!=="number")return q.b4()
f.h(c,r,q+p&255)}break
case 4:for(f=J.J(c),r=0;r<s;++r){q=r<b
if(q)n=0
else{p=r-b
if(!(p>=0&&p<c.length))return A.a(c,p)
n=c[p]}p=d.length
if(!(r<p))return A.a(d,r)
m=d[r]
if(q)l=0
else{q=r-b
if(!(q>=0&&q<p))return A.a(d,q)
l=d[q]}k=n+m-l
j=Math.abs(k-n)
i=Math.abs(k-m)
h=Math.abs(k-l)
if(j<=i&&j<=h)g=n
else g=i<=h?m:l
if(!(r<c.length))return A.a(c,r)
q=c[r]
if(typeof q!=="number")return q.b4()
f.h(c,r,q+g&255)}break
default:throw A.d(A.f("Invalid filter value: "+a))}},
ab(a,b){var s,r,q,p,o,n=this
if(b===0)return 0
if(b===8)return a.q()
if(b===16)return a.k()
for(s=a.c;r=n.c,r<b;){q=a.d
if(q>=s)throw A.d(A.f("Invalid PNG data."))
p=a.a
a.d=q+1
if(!(q>=0&&q<p.length))return A.a(p,q)
n.b=B.a.H(p[q],r)
n.c=r+8}if(b===1)o=1
else if(b===2)o=3
else{if(b===4)s=15
else s=0
o=s}s=r-b
r=B.a.Z(n.b,s)
n.c=s
return(r&o)>>>0},
dB(a,b){var s,r,q=this
t.L.a(b)
s=q.a
r=s.e
switch(r){case 0:s=s.d
s.toString
B.b.h(b,0,q.ab(a,s))
return
case 2:s=s.d
s.toString
B.b.h(b,0,q.ab(a,s))
s=q.a.d
s.toString
B.b.h(b,1,q.ab(a,s))
s=q.a.d
s.toString
B.b.h(b,2,q.ab(a,s))
return
case 3:s=s.d
s.toString
B.b.h(b,0,q.ab(a,s))
return
case 4:s=s.d
s.toString
B.b.h(b,0,q.ab(a,s))
s=q.a.d
s.toString
B.b.h(b,1,q.ab(a,s))
return
case 6:s=s.d
s.toString
B.b.h(b,0,q.ab(a,s))
s=q.a.d
s.toString
B.b.h(b,1,q.ab(a,s))
s=q.a.d
s.toString
B.b.h(b,2,q.ab(a,s))
s=q.a.d
s.toString
B.b.h(b,3,q.ab(a,s))
return}throw A.d(A.f("Invalid color type: "+A.r(r)+"."))},
d8(a){var s,r,q,p,o,n,m,l,k,j,i,h,g=this
t.L.a(a)
s=g.a
r=s.e
switch(r){case 0:q=A.ar("g")
s=g.a
switch(s.d){case 1:q.b=a[0]===0?0:255
break
case 2:q.b=a[0]*85
break
case 4:q.b=a[0]<<4>>>0
break
case 8:q.b=a[0]
break
case 16:q.b=B.a.i(a[0],8)
break}s=s.z
s.toString
q.b=B.b.m(s,q.I())
s=g.a.y
if(s!=null){r=s.length
if(0>=r)return A.a(s,0)
p=s[0]
if(1>=r)return A.a(s,1)
s=s[1]
if(a[0]===((p&255)<<24|s&255)>>>0)return A.aQ(q.I(),q.I(),q.I(),0)}return A.aQ(q.I(),q.I(),q.I(),255)
case 2:o=A.ar("r")
q=A.ar("g")
n=A.ar("b")
s=g.a
switch(s.d){case 1:o.b=a[0]===0?0:255
q.b=a[1]===0?0:255
n.b=a[2]===0?0:255
break
case 2:o.b=a[0]*85
q.b=a[1]*85
n.b=a[2]*85
break
case 4:o.b=a[0]<<4>>>0
q.b=a[1]<<4>>>0
n.b=a[2]<<4>>>0
break
case 8:o.b=a[0]
q.b=a[1]
n.b=a[2]
break
case 16:o.b=B.a.i(a[0],8)
q.b=B.a.i(a[1],8)
n.b=B.a.i(a[2],8)
break}s=s.z
s.toString
o.b=B.b.m(s,o.I())
s=g.a.z
s.toString
q.b=B.b.m(s,q.I())
s=g.a.z
s.toString
n.b=B.b.m(s,n.I())
s=g.a.y
if(s!=null){r=s.length
if(0>=r)return A.a(s,0)
p=s[0]
if(1>=r)return A.a(s,1)
m=s[1]
if(2>=r)return A.a(s,2)
l=s[2]
if(3>=r)return A.a(s,3)
k=s[3]
if(4>=r)return A.a(s,4)
j=s[4]
if(5>=r)return A.a(s,5)
s=s[5]
if(a[0]===((p&255)<<8|m&255)&&a[1]===((l&255)<<8|k&255)&&a[2]===((j&255)<<8|s&255))return A.aQ(o.I(),q.I(),n.I(),0)}return A.aQ(o.I(),q.I(),n.I(),255)
case 3:r=a[0]
i=r*3
p=s.y
if(p!=null&&r<p.length){if(!(r>=0&&r<p.length))return A.a(p,r)
h=p[r]}else h=255
s=s.x
r=s.length
if(i>=r)return A.aQ(255,255,255,h)
if(!(i>=0))return A.a(s,i)
o=s[i]
p=i+1
if(!(p<r))return A.a(s,p)
q=s[p]
p=i+2
if(!(p<r))return A.a(s,p)
return A.aQ(o,q,s[p],h)
case 4:q=A.ar("g")
h=A.ar("a")
s=g.a
switch(s.d){case 1:q.b=a[0]===0?0:255
h.b=a[1]===0?0:255
break
case 2:q.b=a[0]*85
h.b=a[1]*85
break
case 4:q.b=a[0]<<4>>>0
h.b=a[1]<<4>>>0
break
case 8:q.b=a[0]
h.b=a[1]
break
case 16:q.b=B.a.i(a[0],8)
h.b=B.a.i(a[1],8)
break}s=s.z
s.toString
q.b=B.b.m(s,q.I())
return A.aQ(q.I(),q.I(),q.I(),h.I())
case 6:o=A.ar("r")
q=A.ar("g")
n=A.ar("b")
h=A.ar("a")
s=g.a
switch(s.d){case 1:o.b=a[0]===0?0:255
q.b=a[1]===0?0:255
n.b=a[2]===0?0:255
h.b=a[3]===0?0:255
break
case 2:o.b=a[0]*85
q.b=a[1]*85
n.b=a[2]*85
h.b=a[3]*85
break
case 4:o.b=a[0]<<4>>>0
q.b=a[1]<<4>>>0
n.b=a[2]<<4>>>0
h.b=a[3]<<4>>>0
break
case 8:o.b=a[0]
q.b=a[1]
n.b=a[2]
h.b=a[3]
break
case 16:o.b=B.a.i(a[0],8)
q.b=B.a.i(a[1],8)
n.b=B.a.i(a[2],8)
h.b=B.a.i(a[3],8)
break}s=s.z
s.toString
o.b=B.b.m(s,o.I())
s=g.a.z
s.toString
q.b=B.b.m(s,q.I())
s=g.a.z
s.toString
n.b=B.b.m(s,n.I())
return A.aQ(o.I(),q.I(),n.I(),h.I())}throw A.d(A.f("Invalid color type: "+A.r(r)+"."))}}
A.fL.prototype={
$1(a){return a},
$S:7}
A.ef.prototype={
sio(a){t.T.a(a)},
sei(a){t.T.a(a)},
siN(a){t.T.a(a)},
siO(a){t.T.a(a)}}
A.eg.prototype={
sao(a){t.T.a(a)},
saq(a){t.T.a(a)}}
A.au.prototype={}
A.ei.prototype={
sao(a){t.T.a(a)},
saq(a){t.T.a(a)}}
A.ej.prototype={
sao(a){t.T.a(a)},
saq(a){t.T.a(a)}}
A.el.prototype={
sao(a){t.T.a(a)},
saq(a){t.T.a(a)}}
A.em.prototype={
sao(a){t.T.a(a)},
saq(a){t.T.a(a)}}
A.cF.prototype={}
A.ek.prototype={}
A.fO.prototype={
eG(a){var s,r,q,p,o=this
a.k()
a.k()
a.k()
a.k()
s=B.a.F(a.c-a.d,8)
if(s>0){o.e=new Uint16Array(s)
o.f=new Uint16Array(s)
o.r=new Uint16Array(s)
o.w=new Uint16Array(s)
for(r=0;r<s;++r){q=o.e
p=a.k()
if(!(r<q.length))return A.a(q,r)
q[r]=p
p=o.f
q=a.k()
if(!(r<p.length))return A.a(p,r)
p[r]=q
q=o.r
p=a.k()
if(!(r<q.length))return A.a(q,r)
q[r]=p
p=o.w
q=a.k()
if(!(r<p.length))return A.a(p,r)
p[r]=q}}}}
A.br.prototype={
e2(a,b,c,d,e,f,g){if(e==null)e=a.k()
switch(e){case 0:d.toString
this.hE(a,b,c,d)
break
case 1:if(f==null)f=this.hB(a,c)
d.toString
this.hD(a,b,c,d,f,g)
break
default:throw A.d(A.f("Unsupported compression: "+e))}},
iK(a,b,c,d){return this.e2(a,b,c,d,null,null,0)},
hB(a,b){var s,r,q=new Uint16Array(b)
for(s=0;s<b;++s){r=a.k()
if(!(s<b))return A.a(q,s)
q[s]=r}return q},
hE(a,b,c,d){var s,r=b*c
if(d===16)r*=2
if(r>a.c-a.d){s=new Uint8Array(r)
this.c=s
B.d.a6(s,0,r,255)
return}this.c=a.V(r).S()},
hD(a,b,c,d,e,f){var s,r,q,p,o,n,m,l=b*c
if(d===16)l*=2
s=new Uint8Array(l)
this.c=s
r=f*c
q=e.length
if(r>=q){B.d.a6(s,0,l,255)
return}for(p=0,o=0;o<c;++o,r=n){n=r+1
if(!(r>=0&&r<q))return A.a(e,r)
m=a.N(e[r])
a.d=a.d+(m.c-m.d)
this.fs(m,this.c,p)
p+=b}},
fs(a,b,c){var s,r,q,p,o,n,m,l,k
for(s=a.c,r=b.length;q=a.d,q<s;){p=a.a
o=a.d=q+1
n=p.length
if(!(q>=0&&q<n))return A.a(p,q)
q=p[q]
$.W()[0]=q
q=$.a3()
if(0>=q.length)return A.a(q,0)
m=q[0]
if(m<0){m=1-m
a.d=o+1
if(!(o>=0&&o<n))return A.a(p,o)
q=p[o]
for(l=0;l<m;++l,c=k){k=c+1
if(!(c>=0&&c<r))return A.a(b,c)
b[c]=q}}else{++m
for(q=o,l=0;l<m;++l,q=o,c=k){k=c+1
o=q+1
a.d=o
if(!(q>=0&&q<p.length))return A.a(p,q)
q=p[q]
if(!(c>=0&&c<r))return A.a(b,c)
b[c]=q}}}}}
A.fQ.prototype={
eH(a){var s,r,q=this
q.at=A.l(a,!0,null,0)
q.hj()
if(q.d!==943870035)return
s=q.at.j()
q.at.V(s)
s=q.at.j()
q.ax=q.at.V(s)
s=q.at.j()
q.ay=q.at.V(s)
r=q.at
q.ch=r.V(r.c-r.d)},
ap(){var s,r=this
if(r.d===943870035){s=r.at
s===$&&A.c("_input")
s=s==null}else s=!0
if(s)return!1
r.hz()
r.hA()
r.hC()
r.ch=r.ay=r.ax=r.at=null
return!0},
i9(){if(!this.ap())return null
return this.iQ()},
iQ(){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,b0,b1,b2,b3=this,b4=b3.z
if(b4!=null)return b4
b4=A.ak(b3.a,b3.b,B.i)
b3.z=b4
b4=b4.x
B.q.a6(b4,0,b4.length,0)
s=b3.z.aH()
b4=s.length
r=0
while(!0){q=b3.x
q===$&&A.c("layers")
if(!(r<q.length))break
c$0:{p=q[r]
q=p.y
q===$&&A.c("flags")
if((q&2)!==0)break c$0
q=p.w
q===$&&A.c("opacity")
o=q/255
n=p.r
q=p.cx
q===$&&A.c("layerImage")
m=q.aH()
q=p.a
q.toString
l=m.length
k=q
j=0
i=0
while(!0){q=p.f
q===$&&A.c("height")
if(!(j<q))break
q=p.a
q.toString
h=b3.a
if(typeof h!=="number")return A.P(h)
g=p.b
g.toString
f=(q+j)*h*4+g*4
q=k>=0
e=g
d=0
while(!0){h=p.e
h===$&&A.c("width")
if(!(d<h))break
c=i+1
if(!(i>=0&&i<l))return A.a(m,i)
b=m[i]
i=c+1
if(!(c>=0&&c<l))return A.a(m,c)
a=m[c]
c=i+1
if(!(i>=0&&i<l))return A.a(m,i)
a0=m[i]
i=c+1
if(!(c>=0&&c<l))return A.a(m,c)
a1=m[c]
if(e>=0){h=b3.a
if(typeof h!=="number")return A.P(h)
if(e<h)if(q){h=b3.b
if(typeof h!=="number")return A.P(h)
h=k<h}else h=!1
else h=!1}else h=!1
if(h){if(!(f>=0&&f<b4))return A.a(s,f)
a2=s[f]
h=f+1
if(!(h<b4))return A.a(s,h)
a3=s[h]
g=f+2
if(!(g<b4))return A.a(s,g)
a4=s[g]
g=f+3
if(!(g<b4))return A.a(s,g)
a5=s[g]
a6=a1/255*o
switch(n){case 1885434739:a7=a5
a8=a4
a9=a3
b0=a2
break
case 1852797549:a7=a1
a8=a0
a9=a
b0=b
break
case 1684632435:a7=a1
a8=a0
a9=a
b0=b
break
case 1684107883:b0=Math.min(a2,b)
a9=Math.min(a3,a)
a8=Math.min(a4,a0)
a7=a1
break
case 1836411936:b0=a2*b>>>8
a9=a3*a>>>8
a8=a4*a0>>>8
a7=a1
break
case 1768188278:b0=A.fR(a2,b)
a9=A.fR(a3,a)
a8=A.fR(a4,a0)
a7=a1
break
case 1818391150:b0=B.c.n(B.a.p(a2+b-255,0,255))
a9=B.c.n(B.a.p(a3+a-255,0,255))
a8=B.c.n(B.a.p(a4+a0-255,0,255))
a7=a1
break
case 1684751212:a7=a1
a8=a0
a9=a
b0=b
break
case 1818850405:b0=Math.max(a2,b)
a9=Math.max(a3,a)
a8=Math.max(a4,a0)
a7=a1
break
case 1935897198:b0=B.c.n(B.a.p(255-(255-b)*(255-a2),0,255))
a9=B.c.n(B.a.p(255-(255-a)*(255-a3),0,255))
a8=B.c.n(B.a.p(255-(255-a0)*(255-a4),0,255))
a7=a1
break
case 1684633120:b0=A.fS(a2,b)
a9=A.fS(a3,a)
a8=A.fS(a4,a0)
a7=a1
break
case 1818518631:b0=b+a2>255?255:a2+b
a9=a+a3>255?255:a3+a
a8=a0+a4>255?255:a4+a0
a7=a1
break
case 1818706796:a7=a1
a8=a0
a9=a
b0=b
break
case 1870030194:b0=A.j9(a2,b,a5,a1)
a9=A.j9(a3,a,a5,a1)
a8=A.j9(a4,a0,a5,a1)
a7=a1
break
case 1934387572:b0=A.ja(a2,b)
a9=A.ja(a3,a)
a8=A.ja(a4,a0)
a7=a1
break
case 1749838196:b0=A.j7(a2,b)
a9=A.j7(a3,a)
a8=A.j7(a4,a0)
a7=a1
break
case 1984719220:b0=A.jb(a2,b)
a9=A.jb(a3,a)
a8=A.jb(a4,a0)
a7=a1
break
case 1816947060:b0=A.j8(a2,b)
a9=A.j8(a3,a)
a8=A.j8(a4,a0)
a7=a1
break
case 1884055924:b0=b<128?Math.min(a2,2*b):Math.max(a2,2*(b-128))
a9=a<128?Math.min(a3,2*a):Math.max(a3,2*(a-128))
a8=a0<128?Math.min(a4,2*a0):Math.max(a4,2*(a0-128))
a7=a1
break
case 1749903736:b0=b<255-a2?0:255
a9=a<255-a3?0:255
a8=a0<255-a4?0:255
a7=a1
break
case 1684629094:b0=Math.abs(b-a2)
a9=Math.abs(a-a3)
a8=Math.abs(a0-a4)
a7=a1
break
case 1936553316:b0=B.c.ak(b+a2-2*b*a2/255)
a9=B.c.ak(a+a3-2*a*a3/255)
a8=B.c.ak(a0+a4-2*a0*a4/255)
a7=a1
break
case 1718842722:a7=a1
a8=a0
a9=a
b0=b
break
case 1717856630:a7=a1
a8=a0
a9=a
b0=b
break
case 1752524064:a7=a1
a8=a0
a9=a
b0=b
break
case 1935766560:a7=a1
a8=a0
a9=a
b0=b
break
case 1668246642:a7=a1
a8=a0
a9=a
b0=b
break
case 1819634976:a7=a1
a8=a0
a9=a
b0=b
break
default:a7=a1
a8=a0
a9=a
b0=b}g=1-a6
b0=B.c.n(a2*g+b0*a6)
a9=B.c.n(a3*g+a9*a6)
a8=B.c.n(a4*g+a8*a6)
a7=B.c.n(a5*g+a7*a6)
s[f]=b0
b1=h+1
s[h]=a9
b2=b1+1
if(!(b1<b4))return A.a(s,b1)
s[b1]=a8
if(!(b2<b4))return A.a(s,b2)
s[b2]=a7}f+=4;++d;++e}++j;++k}}++r}b4=b3.z
b4.toString
return b4},
hj(){var s,r,q,p,o,n=this,m=n.at
m===$&&A.c("_input")
n.d=m.j()
m=n.at.k()
n.e=m
if(m!==1){n.d=0
return}s=n.at.V(6)
for(m=s.a,r=s.d,q=m.length,p=0;p<6;++p){o=r+p
if(!(o>=0&&o<q))return A.a(m,o)
if(m[o]!==0){n.d=0
return}}n.f=n.at.k()
n.b=n.at.j()
n.a=n.at.j()
n.r=n.at.k()
n.w=n.at.k()},
hz(){var s,r,q,p,o,n,m,l=this,k=l.ax
k===$&&A.c("_imageResourceData")
k.d=k.b
for(k=l.Q;s=l.ax,s.d<s.c;){r=s.j()
q=l.ax.k()
s=l.ax
p=s.a
o=s.d++
if(!(o>=0&&o<p.length))return A.a(p,o)
o=p[o]
s.L(o)
if((o&1)===0)++l.ax.d
n=l.ax.j()
s=l.ax
m=s.N(n)
s.d=s.d+(m.c-m.d)
if((n&1)===1)++l.ax.d
if(r===943868237)k.h(0,q,new A.eh())}},
hA(){var s,r,q,p,o,n,m,l,k,j,i=this,h=i.ay
h===$&&A.c("_layerAndMaskData")
h.d=h.b
s=h.j()
if((s&1)!==0)++s
r=i.ay.V(s)
h=t.cE
i.seR(t.dl.a(A.b([],h)))
if(s>0){q=r.k()
$.a2()[0]=q
q=$.a7()
if(0>=q.length)return A.a(q,0)
p=q[0]
if(p<0)p=-p
for(q=t.N,o=t.hf,n=t.af,m=0;m<p;++m){l=new A.cE(A.H(q,o),A.b([],h),A.b([],n))
l.eI(r)
k=i.x
k===$&&A.c("layers")
B.b.v(k,l)}}m=0
while(!0){h=i.x
h===$&&A.c("layers")
if(!(m<h.length))break
h[m].iH(r,i);++m}s=i.ay.j()
j=i.ay.V(s)
if(s>0){j.k()
j.k()
j.k()
j.k()
j.k()
j.k()
j.q()}},
hC(){var s,r,q,p,o,n,m,l,k=this,j="channels",i="mergeImageChannels",h=k.ch
h===$&&A.c("_imageData")
h.d=h.b
s=h.k()
if(s===1){h=k.b
r=k.f
r===$&&A.c(j)
if(typeof h!=="number")return h.af()
q=h*r
p=new Uint16Array(q)
for(o=0;o<q;++o)p[o]=k.ch.k()}else p=null
k.seS(t.I.a(A.b([],t.h)))
o=0
while(!0){h=k.f
h===$&&A.c(j)
if(!(o<h))break
h=k.y
h===$&&A.c(i)
r=k.ch
r.toString
n=o===3?-1:o
n=new A.br(n)
n.e2(r,k.a,k.b,k.r,s,p,o)
B.b.v(h,n);++o}h=k.w
r=k.r
n=k.a
m=k.b
l=k.y
l===$&&A.c(i)
k.z=A.kz(h,r,n,m,l)},
seR(a){this.x=t.dl.a(a)},
seS(a){this.y=t.I.a(a)}}
A.eh.prototype={}
A.cE.prototype={
eI(a7){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4=this,a5=a7.j(),a6=$.z()
a6[0]=a5
a5=$.M()
if(0>=a5.length)return A.a(a5,0)
a4.a=a5[0]
a6[0]=a7.j()
a4.b=a5[0]
a6[0]=a7.j()
a4.c=a5[0]
a6[0]=a7.j()
a5=a5[0]
a4.d=a5
a6=a4.b
a6.toString
a4.e=a5-a6
a6=a4.c
a5=a4.a
a5.toString
a4.f=a6-a5
a4.seT(t.I.a(A.b([],t.h)))
s=a7.k()
for(r=0;r<s;++r){a5=a7.k()
$.a2()[0]=a5
a5=$.a7()
if(0>=a5.length)return A.a(a5,0)
q=a5[0]
a7.j()
a5=a4.as
a5===$&&A.c("channels")
B.b.v(a5,new A.br(q))}p=a7.j()
if(p!==943868237)throw A.d(A.f("Invalid PSD layer signature: "+B.a.ar(p,16)))
a4.r=a7.j()
a4.w=a7.q()
a7.q()
a4.y=a7.q()
if(a7.q()!==0)throw A.d(A.f("Invalid PSD layer data"))
o=a7.j()
n=a7.V(o)
if(o>0){o=n.j()
if(o>0){m=n.V(o)
a5=m.d
m.j()
m.j()
m.j()
m.j()
m.q()
m.q()
if(m.c-a5===20)m.d+=2
else{m.q()
m.q()
m.j()
m.j()
m.j()
m.j()}}o=n.j()
if(o>0)new A.fO().eG(n.V(o))
o=n.q()
n.L(o)
l=4-B.a.P(o,4)-1
if(l>0)n.d+=l
for(a5=n.c,a6=a4.ay,k=a4.cy,j=t.t,i=t.g0;n.d<a5;){p=n.j()
if(p!==943868237)throw A.d(A.f("PSD invalid signature for layer additional data: "+B.a.ar(p,16)))
h=n.L(4)
o=n.j()
g=n.N(o)
f=n.d+(g.c-g.d)
n.d=f
if((o&1)===1)n.d=f+1
a6.h(0,h,A.mH(h,g))
if(h==="lrFX"){e=A.i(i.a(a6.m(0,"lrFX")).b,null,0)
e.k()
d=e.k()
for(c=0;c<d;++c){e.L(4)
b=e.L(4)
a=e.j()
if(b==="dsdw"){a0=new A.eg()
B.b.v(k,a0)
a0.a=e.j()
e.j()
e.j()
e.j()
e.j()
a0.sao(A.b([e.k(),e.k(),e.k(),e.k(),e.k()],j))
e.L(8)
f=e.a
a1=e.d
a2=e.d=a1+1
a3=f.length
if(!(a1>=0&&a1<a3))return A.a(f,a1)
a1=e.d=a2+1
if(!(a2>=0&&a2<a3))return A.a(f,a2)
e.d=a1+1
if(!(a1>=0&&a1<a3))return A.a(f,a1)
a0.saq(A.b([e.k(),e.k(),e.k(),e.k(),e.k()],j))}else if(b==="isdw"){a0=new A.ej()
B.b.v(k,a0)
a0.a=e.j()
e.j()
e.j()
e.j()
e.j()
a0.sao(A.b([e.k(),e.k(),e.k(),e.k(),e.k()],j))
e.L(8)
f=e.a
a1=e.d
a2=e.d=a1+1
a3=f.length
if(!(a1>=0&&a1<a3))return A.a(f,a1)
a1=e.d=a2+1
if(!(a2>=0&&a2<a3))return A.a(f,a2)
e.d=a1+1
if(!(a1>=0&&a1<a3))return A.a(f,a1)
a0.saq(A.b([e.k(),e.k(),e.k(),e.k(),e.k()],j))}else if(b==="oglw"){a0=new A.el()
B.b.v(k,a0)
a0.a=e.j()
e.j()
e.j()
a0.sao(A.b([e.k(),e.k(),e.k(),e.k(),e.k()],j))
e.L(8)
f=e.a
a1=e.d
a2=e.d=a1+1
a3=f.length
if(!(a1>=0&&a1<a3))return A.a(f,a1)
e.d=a2+1
if(!(a2>=0&&a2<a3))return A.a(f,a2)
if(a0.a===2)a0.saq(A.b([e.k(),e.k(),e.k(),e.k(),e.k()],j))}else if(b==="iglw"){a0=new A.ei()
B.b.v(k,a0)
a0.a=e.j()
e.j()
e.j()
a0.sao(A.b([e.k(),e.k(),e.k(),e.k(),e.k()],j))
e.L(8)
f=e.a
a1=e.d
a2=e.d=a1+1
a3=f.length
if(!(a1>=0&&a1<a3))return A.a(f,a1)
a1=e.d=a2+1
if(!(a2>=0&&a2<a3))return A.a(f,a2)
if(a0.a===2){e.d=a1+1
if(!(a1>=0&&a1<a3))return A.a(f,a1)
a0.saq(A.b([e.k(),e.k(),e.k(),e.k(),e.k()],j))}}else if(b==="bevl"){a0=new A.ef()
B.b.v(k,a0)
a0.a=e.j()
e.j()
e.j()
e.j()
e.L(8)
e.L(8)
a0.sio(A.b([e.k(),e.k(),e.k(),e.k(),e.k()],j))
a0.sei(A.b([e.k(),e.k(),e.k(),e.k(),e.k()],j))
f=e.a
a1=e.d
a2=e.d=a1+1
a3=f.length
if(!(a1>=0&&a1<a3))return A.a(f,a1)
a1=e.d=a2+1
if(!(a2>=0&&a2<a3))return A.a(f,a2)
a2=e.d=a1+1
if(!(a1>=0&&a1<a3))return A.a(f,a1)
a1=e.d=a2+1
if(!(a2>=0&&a2<a3))return A.a(f,a2)
a2=e.d=a1+1
if(!(a1>=0&&a1<a3))return A.a(f,a1)
e.d=a2+1
if(!(a2>=0&&a2<a3))return A.a(f,a2)
if(a0.a===2){a0.siN(A.b([e.k(),e.k(),e.k(),e.k(),e.k()],j))
a0.siO(A.b([e.k(),e.k(),e.k(),e.k(),e.k()],j))}}else if(b==="sofi"){a0=new A.em()
B.b.v(k,a0)
a0.a=e.j()
e.L(4)
a0.sao(A.b([e.k(),e.k(),e.k(),e.k(),e.k()],j))
f=e.a
a1=e.d
a2=e.d=a1+1
a3=f.length
if(!(a1>=0&&a1<a3))return A.a(f,a1)
e.d=a2+1
if(!(a2>=0&&a2<a3))return A.a(f,a2)
a0.saq(A.b([e.k(),e.k(),e.k(),e.k(),e.k()],j))}else e.d+=a}}}}},
iH(a,b){var s,r,q,p,o,n=this,m=0
while(!0){s=n.as
s===$&&A.c("channels")
if(!(m<s.length))break
s=s[m]
r=n.e
r===$&&A.c("width")
q=n.f
q===$&&A.c("height")
s.iK(a,r,q,b.r);++m}r=b.w
q=b.r
p=n.e
p===$&&A.c("width")
o=n.f
o===$&&A.c("height")
n.cx=A.kz(r,q,p,o,s)},
seT(a){this.as=t.I.a(a)}}
A.bP.prototype={}
A.fP.prototype={
a5(a){this.a=A.ky(t.L.a(a))
return this.Y(0)},
Y(a){var s=this.a
if(s==null)return null
return s.i9()}}
A.h_.prototype={}
A.fZ.prototype={
b1(a){var s=A.l(t.L.a(a),!0,null,0).V(18),r=s.a,q=s.d,p=q+2,o=r.length
if(!(p>=0&&p<o))return A.a(r,p)
if(r[p]!==2)return!1
q+=16
if(!(q>=0&&q<o))return A.a(r,q)
q=r[q]
if(q!==24&&q!==32)return!1
return!0},
am(a){var s,r,q,p,o,n,m,l,k=this
t.L.a(a)
k.a=new A.h_()
s=A.l(a,!0,null,0)
k.b=s
r=s.V(18)
s=r.a
q=r.d
p=q+2
o=s.length
if(!(p>=0&&p<o))return A.a(s,p)
if(s[p]!==2)return null
p=q+16
if(!(p>=0&&p<o))return A.a(s,p)
p=s[p]
if(p!==24&&p!==32)return null
n=k.a
n.toString
m=q+12
if(!(m>=0&&m<o))return A.a(s,m)
m=s[m]
l=q+13
if(!(l>=0&&l<o))return A.a(s,l)
n.a=m&255|(s[l]&255)<<8
l=q+14
if(!(l>=0&&l<o))return A.a(s,l)
l=s[l]
q+=15
if(!(q>=0&&q<o))return A.a(s,q)
n.b=l&255|(s[q]&255)<<8
n.d=k.b.d
n.e=p
return n},
Y(a){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e=this,d=e.a
if(d==null)return null
s=e.b
s===$&&A.c("input")
r=d.d
r.toString
s.d=r
q=A.ak(d.a,d.b,B.G)
for(p=q.b-1,d=q.a,s=q.x,r=s.length;p>=0;--p)for(o=p*d,n=0;n<d;++n){m=e.b
l=m.a
k=m.d
j=m.d=k+1
i=l.length
if(!(k>=0&&k<i))return A.a(l,k)
k=l[k]
h=m.d=j+1
if(!(j>=0&&j<i))return A.a(l,j)
j=l[j]
g=m.d=h+1
if(!(h>=0&&h<i))return A.a(l,h)
h=l[h]
if(e.a.e===32){m.d=g+1
if(!(g>=0&&g<i))return A.a(l,g)
f=l[g]}else f=255
m=B.c.n(B.a.p(f,0,255))
k=B.c.n(B.a.p(k,0,255))
j=B.c.n(B.a.p(j,0,255))
h=B.c.n(B.a.p(h,0,255))
l=o+n
if(!(l>=0&&l<r))return A.a(s,l)
s[l]=(m<<24|k<<16|j<<8|h)>>>0}return q},
a5(a){if(this.am(t.L.a(a))==null)return null
return this.Y(0)}}
A.h9.prototype={
K(a){var s,r,q,p,o,n=this
if(a===0)return 0
if(n.c===0){n.c=8
n.b=n.a.q()}for(s=n.a,r=0;q=n.c,a>q;){p=B.a.H(r,q)
o=n.b
if(!(q>=0&&q<9))return A.a(B.j,q)
r=p+(o&B.j[q])
a-=q
n.c=8
q=s.a
o=s.d++
if(!(o>=0&&o<q.length))return A.a(q,o)
n.b=q[o]}if(a>0){if(q===0){n.c=8
n.b=s.q()}s=B.a.H(r,a)
q=n.b
p=n.c-a
q=B.a.X(q,p)
if(!(a<9))return A.a(B.j,a)
r=s+(q&B.j[a])
n.c=p}return r}}
A.ew.prototype={
t(a){var s=this,r=s.a
if(B.am.a2(r))return A.r(B.am.m(0,r))+": "+s.b+" "+s.c
return"<"+r+">: "+s.b+" "+s.c},
iM(){var s=this.d
s.toString
this.e.d=s
return this.ag()},
cC(){var s,r,q=this,p=q.d
p.toString
q.e.d=p
s=A.b([],t.t)
for(p=q.c,r=0;r<p;++r)B.b.v(s,q.ag())
return s},
ag(){var s,r,q,p=this
switch(p.b){case 1:case 2:return p.e.q()
case 3:return p.e.k()
case 4:return p.e.j()
case 5:s=p.e
r=s.j()
q=s.j()
if(q===0)return 0
return B.a.O(r,q)
case 6:throw A.d(A.f("Unhandled value type: SBYTE"))
case 7:return p.e.q()
case 8:throw A.d(A.f("Unhandled value type: SSHORT"))
case 9:throw A.d(A.f("Unhandled value type: SLONG"))
case 10:throw A.d(A.f("Unhandled value type: SRATIONAL"))
case 11:throw A.d(A.f("Unhandled value type: FLOAT"))
case 12:throw A.d(A.f("Unhandled value type: DOUBLE"))}return 0}}
A.hb.prototype={
i6(a,b,c,d){var s,r,q,p=this
p.r=b
p.x=p.w=0
s=B.a.F(p.a+7,8)
for(r=0,q=0;q<d;++q){p.c7(a,r,c)
r+=s}},
c7(a,b,c){var s,r,q,p,o,n,m,l=this
l.d=0
for(s=l.a,r=!0;c<s;){for(;r;){q=l.aB(10)
if(!(q<1024))return A.a(B.D,q)
p=B.D[q]
o=B.a.i(p,1)&15
if(o===12){q=(q<<2&12|l.a_(2))>>>0
if(!(q<16))return A.a(B.l,q)
p=B.l[q]
n=B.a.i(p,1)
c+=B.a.i(p,4)&4095
l.T(4-(n&7))}else if(o===0)throw A.d(A.f("TIFFFaxDecoder0"))
else if(o===15)throw A.d(A.f("TIFFFaxDecoder1"))
else{c+=B.a.i(p,5)&2047
l.T(10-o)
if((p&1)===0){B.b.h(l.f,l.d++,c)
r=!1}}}if(c===s){if(l.z===2)if(l.w!==0){s=l.x
s.toString
l.x=s+1
l.w=0}break}for(;!r;){q=l.a_(4)
if(!(q<16))return A.a(B.y,q)
p=B.y[q]
m=p>>>5&2047
if(m===100){q=l.aB(9)
if(!(q<512))return A.a(B.F,q)
p=B.F[q]
o=B.a.i(p,1)&15
m=B.a.i(p,5)&2047
if(o===12){l.T(5)
q=l.a_(4)
if(!(q<16))return A.a(B.l,q)
p=B.l[q]
n=B.a.i(p,1)
m=B.a.i(p,4)&4095
l.a1(a,b,c,m)
c+=m
l.T(4-(n&7))}else if(o===15)throw A.d(A.f("TIFFFaxDecoder2"))
else{l.a1(a,b,c,m)
c+=m
l.T(9-o)
if((p&1)===0){B.b.h(l.f,l.d++,c)
r=!0}}}else{if(m===200){q=l.a_(2)
if(!(q<4))return A.a(B.x,q)
p=B.x[q]
m=p>>>5&2047
l.a1(a,b,c,m)
c+=m
l.T(2-(p>>>1&15))
B.b.h(l.f,l.d++,c)}else{l.a1(a,b,c,m)
c+=m
l.T(4-(p>>>1&15))
B.b.h(l.f,l.d++,c)}r=!0}}if(c===s){if(l.z===2)if(l.w!==0){s=l.x
s.toString
l.x=s+1
l.w=0}break}}B.b.h(l.f,l.d++,c)},
i7(a1,a2,a3,a4,a5){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0=this
a0.r=a2
a0.z=3
a0.x=a0.w=0
s=a0.a
r=B.a.F(s+7,8)
q=A.U(2,null,!1,t.B)
a0.at=a5&1
a0.as=a5>>>2&1
if(a0.dz()!==1)throw A.d(A.f("TIFFFaxDecoder3"))
a0.c7(a1,0,a3)
for(p=r,o=1;o<a4;++o){if(a0.dz()===0){n=a0.e
a0.scA(a0.f)
a0.scu(n)
a0.y=0
m=a3
l=-1
k=!0
j=0
while(!0){m.toString
if(!(m<s))break
a0.de(l,k,q)
i=q[0]
h=q[1]
g=a0.a_(7)
if(!(g<128))return A.a(B.z,g)
g=B.z[g]&255
f=g>>>3&15
e=g&7
if(f===0){if(!k){h.toString
a0.a1(a1,p,m,h-m)}a0.T(7-e)
m=h
l=m}else if(f===1){a0.T(7-e)
d=j+1
c=d+1
if(k){m+=a0.bE()
B.b.h(a0.f,j,m)
b=a0.bD()
a0.a1(a1,p,m,b)
m+=b
B.b.h(a0.f,d,m)}else{b=a0.bD()
a0.a1(a1,p,m,b)
m+=b
B.b.h(a0.f,j,m)
m+=a0.bE()
B.b.h(a0.f,d,m)}j=c
l=m}else{if(f<=8){i.toString
a=i+(f-5)
d=j+1
B.b.h(a0.f,j,a)
k=!k
if(k)a0.a1(a1,p,m,a-m)
a0.T(7-e)}else throw A.d(A.f("TIFFFaxDecoder4"))
m=a
j=d
l=m}}B.b.h(a0.f,j,m)
a0.d=j+1}else a0.c7(a1,p,a3)
p+=r}},
ib(a4,a5,a6,a7,a8){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3=this
a3.r=a5
a3.z=4
a3.x=a3.w=0
s=a3.a
r=B.a.F(s+7,8)
q=A.U(2,null,!1,t.B)
p=a3.f
a3.d=0
a3.d=1
B.b.h(p,0,s)
B.b.h(p,a3.d++,s)
for(o=0,n=0;n<a7;++n){m=a3.e
a3.scA(a3.f)
a3.scu(m)
a3.y=0
l=a6
k=-1
j=!0
i=0
while(!0){l.toString
if(!(l<s))break
a3.de(k,j,q)
h=q[0]
g=q[1]
f=a3.a_(7)
if(!(f<128))return A.a(B.z,f)
f=B.z[f]&255
e=f>>>3&15
d=f&7
if(e===0){if(!j){g.toString
a3.a1(a4,o,l,g-l)}a3.T(7-d)
l=g
k=l}else if(e===1){a3.T(7-d)
c=i+1
b=c+1
if(j){l+=a3.bE()
B.b.h(m,i,l)
a=a3.bD()
a3.a1(a4,o,l,a)
l+=a
B.b.h(m,c,l)}else{a=a3.bD()
a3.a1(a4,o,l,a)
l+=a
B.b.h(m,i,l)
l+=a3.bE()
B.b.h(m,c,l)}i=b
k=l}else if(e<=8){h.toString
a0=h+(e-5)
c=i+1
B.b.h(m,i,a0)
j=!j
if(j)a3.a1(a4,o,l,a0-l)
a3.T(7-d)
l=a0
i=c
k=l}else if(e===11){if(a3.a_(3)!==7)throw A.d(A.f("TIFFFaxDecoder5"))
for(a1=0,a2=!1;!a2;){for(;a3.a_(1)!==1;)++a1
if(a1>5){a1-=6
if(!j&&a1>0){c=i+1
B.b.h(m,i,l)
i=c}l+=a1
if(a1>0)j=!0
if(a3.a_(1)===0){if(!j){c=i+1
B.b.h(m,i,l)
i=c}j=!0}else{if(j){c=i+1
B.b.h(m,i,l)
i=c}j=!1}a2=!0}if(a1===5){if(!j){c=i+1
B.b.h(m,i,l)
i=c}l+=a1
j=!0}else{l+=a1
c=i+1
B.b.h(m,i,l)
a3.a1(a4,o,l,1);++l
i=c
j=!1}}}else throw A.d(A.f("TIFFFaxDecoder5 "+e))}B.b.h(m,i,l)
a3.d=i+1
o+=r}},
bE(){var s,r,q,p,o,n,m=this
for(s=0,r=!0;r;){q=m.aB(10)
if(!(q<1024))return A.a(B.D,q)
p=B.D[q]
o=B.a.i(p,1)&15
if(o===12){q=(q<<2&12|m.a_(2))>>>0
if(!(q<16))return A.a(B.l,q)
p=B.l[q]
n=B.a.i(p,1)
s+=B.a.i(p,4)&4095
m.T(4-(n&7))}else if(o===0)throw A.d(A.f("TIFFFaxDecoder0"))
else if(o===15)throw A.d(A.f("TIFFFaxDecoder1"))
else{s+=B.a.i(p,5)&2047
m.T(10-o)
if((p&1)===0)r=!1}}return s},
bD(){var s,r,q,p,o,n,m,l=this
for(s=0,r=!1;!r;){q=l.a_(4)
if(!(q<16))return A.a(B.y,q)
p=B.y[q]
o=p>>>5&2047
if(o===100){q=l.aB(9)
if(!(q<512))return A.a(B.F,q)
p=B.F[q]
n=B.a.i(p,1)&15
m=B.a.i(p,5)
if(n===12){l.T(5)
q=l.a_(4)
if(!(q<16))return A.a(B.l,q)
p=B.l[q]
m=B.a.i(p,1)
s+=B.a.i(p,4)&4095
l.T(4-(m&7))}else if(n===15)throw A.d(A.f("TIFFFaxDecoder2"))
else{s+=m&2047
l.T(9-n)
if((p&1)===0)r=!0}}else{if(o===200){q=l.a_(2)
if(!(q<4))return A.a(B.x,q)
p=B.x[q]
s+=p>>>5&2047
l.T(2-(p>>>1&15))}else{s+=o
l.T(4-(p>>>1&15))}r=!0}}return s},
dz(){var s,r,q=this,p="TIFFFaxDecoder8",o=q.as
if(o===0){if(q.aB(12)!==1)throw A.d(A.f("TIFFFaxDecoder6"))}else if(o===1){o=q.w
o.toString
s=8-o
if(q.aB(s)!==0)throw A.d(A.f(p))
if(s<4)if(q.aB(8)!==0)throw A.d(A.f(p))
for(;r=q.aB(8),r!==1;)if(r!==0)throw A.d(A.f(p))}if(q.at===0)return 1
else return q.a_(1)},
de(a,b,c){var s,r,q,p,o,n,m=this
t.cP.a(c)
s=m.e
r=m.d
q=m.y
p=q>0?q-1:0
p=b?(p&4294967294)>>>0:(p|1)>>>0
for(q=s.length,o=p;o<r;o+=2){if(!(o<q))return A.a(s,o)
n=s[o]
n.toString
a.toString
if(n>a){m.y=o
B.b.h(c,0,n)
break}}n=o+1
if(n<r){if(!(n<q))return A.a(s,n)
B.b.h(c,1,s[n])}},
a1(a,b,c,d){var s,r,q,p,o,n=8*b+A.n(c),m=n+d,l=B.a.i(n,3),k=n&7
if(k>0){s=B.a.H(1,7-k)
r=a.a
q=a.d+l
if(!(q>=0&&q<r.length))return A.a(r,q)
p=r[q]
while(!0){if(!(s>0&&n<m))break
p=(p|s)>>>0
s=s>>>1;++n}a.h(0,l,p)}l=B.a.i(n,3)
for(r=m-7;n<r;l=o){o=l+1
J.m(a.a,a.d+l,255)
n+=8}for(;n<m;){l=B.a.i(n,3)
r=a.a
q=a.d+l
if(!(q>=0&&q<r.length))return A.a(r,q)
J.m(r,q,(r[q]|B.a.H(1,7-(n&7)))>>>0);++n}},
aB(a){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d=this,c=d.r
c===$&&A.c("data")
s=c.d
r=c.c-s-1
q=d.x
p=d.c
if(p===1){q.toString
c=c.a
p=s+q
o=c.length
if(!(p>=0&&p<o))return A.a(c,p)
n=c[p]
if(q===r){m=0
l=0}else{p=q+1
k=s+p
if(p===r){if(!(k>=0&&k<o))return A.a(c,k)
m=c[k]
l=0}else{if(!(k>=0&&k<o))return A.a(c,k)
m=c[k]
s+=q+2
if(!(s>=0&&s<o))return A.a(c,s)
l=c[s]}}}else if(p===2){q.toString
c=c.a
p=s+q
o=c.length
if(!(p>=0&&p<o))return A.a(c,p)
n=B.o[c[p]&255]
if(q===r){m=0
l=0}else{p=q+1
k=s+p
if(p===r){if(!(k>=0&&k<o))return A.a(c,k)
m=B.o[c[k]&255]
l=0}else{if(!(k>=0&&k<o))return A.a(c,k)
m=B.o[c[k]&255]
s+=q+2
if(!(s>=0&&s<o))return A.a(c,s)
l=B.o[c[s]&255]}}}else throw A.d(A.f("TIFFFaxDecoder7"))
c=d.w
c.toString
j=8-c
i=a-j
if(i>8){h=i-8
g=8}else{g=i
h=0}q.toString
c=d.x=q+1
if(!(j>=0&&j<9))return A.a(B.j,j)
f=B.a.H(n&B.j[j],i)
if(!(g>=0))return A.a(B.p,g)
e=B.a.Z(m&B.p[g],8-g)
if(h!==0){e=B.a.H(e,h)
if(!(h<9))return A.a(B.p,h)
e|=B.a.Z(l&B.p[h],8-h)
d.x=c+1
d.w=h}else if(g===8){d.w=0
d.x=c+1}else d.w=g
return(f|e)>>>0},
a_(a){var s,r,q,p,o,n,m,l,k,j,i,h=this,g=h.r
g===$&&A.c("data")
s=g.d
r=g.c-s-1
q=h.x
p=h.c
if(p===1){q.toString
g=g.a
p=s+q
o=g.length
if(!(p>=0&&p<o))return A.a(g,p)
n=g[p]
if(q===r)m=0
else{s+=q+1
if(!(s>=0&&s<o))return A.a(g,s)
m=g[s]}}else if(p===2){q.toString
g=g.a
p=s+q
o=g.length
if(!(p>=0&&p<o))return A.a(g,p)
n=B.o[g[p]&255]
if(q===r)m=0
else{s+=q+1
if(!(s>=0&&s<o))return A.a(g,s)
m=B.o[g[s]&255]}}else throw A.d(A.f("TIFFFaxDecoder7"))
g=h.w
g.toString
l=8-g
k=a-l
j=l-a
if(j>=0){if(!(l>=0&&l<9))return A.a(B.j,l)
i=B.a.Z(n&B.j[l],j)
g+=a
h.w=g
if(g===8){h.w=0
q.toString
h.x=q+1}}else{if(!(l>=0&&l<9))return A.a(B.j,l)
i=B.a.H(n&B.j[l],-j)
if(!(k>=0&&k<9))return A.a(B.p,k)
i=(i|B.a.Z(m&B.p[k],8-k))>>>0
q.toString
h.x=q+1
h.w=k}return i},
T(a){var s,r=this,q=r.w
q.toString
s=q-a
if(s<0){q=r.x
q.toString
r.x=q-1
r.w=8+s}else r.w=s},
scA(a){this.e=t.k.a(a)},
scu(a){this.f=t.k.a(a)}}
A.ex.prototype={
eK(a){var s,r,q,p,o,n,m,l,k,j,i,h,g=this,f=A.i(a,null,0),e=a.k()
for(s=g.a,r=0;r<e;++r){q=a.k()
p=a.k()
o=a.j()
n=new A.ew(q,p,o,f)
if(p<13&&p>0){if(!(p<14))return A.a(B.ak,p)
m=B.ak[p]}else m=0
if(o*m>4)n.d=a.j()
else{m=a.d
n.d=m
a.d=m+4}s.h(0,q,n)
if(q===256){m=n.d
m.toString
f.d=m
g.b=n.ag()}else if(q===257){m=n.d
m.toString
f.d=m
g.c=n.ag()}else if(q===262){m=n.d
m.toString
f.d=m
g.d=n.ag()}else if(q===259){m=n.d
m.toString
f.d=m
g.e=n.ag()}else if(q===258){m=n.d
m.toString
f.d=m
g.f=n.ag()}else if(q===277){m=n.d
m.toString
f.d=m
g.r=n.ag()}else if(q===317){m=n.d
m.toString
f.d=m
g.z=n.ag()}else if(q===339){m=n.d
m.toString
f.d=m
g.w=n.ag()}else if(q===320){g.shZ(n.cC())
g.go=0
m=g.fy.length/3|0
g.id=m
g.k1=m*2}}if(g.b===0||g.c===0)return
m=g.fy
if(m!=null&&g.f===8)for(l=m.length,r=0;r<l;++r){m=g.fy
if(!(r<m.length))return A.a(m,r)
B.b.h(m,r,B.a.i(m[r],8))}if(g.d===0)g.y=!0
if(s.a2(324)){g.ax=g.aZ(322)
g.ay=g.aZ(323)
g.se6(g.bJ(324))
g.se5(g.bJ(325))}else{g.ax=g.bI(322,g.b)
if(!s.a2(278))g.ay=g.bI(323,g.c)
else{k=g.aZ(278)
if(k===-1)g.ay=g.c
else g.ay=k}g.se6(g.bJ(273))
g.se5(g.bJ(279))}m=g.b
j=g.ax
g.cx=B.a.O(m+j-1,j)
j=g.c
m=g.ay
g.cy=B.a.O(j+m-1,m)
g.dx=g.bI(266,1)
g.dy=g.aZ(292)
g.fr=g.aZ(293)
g.aZ(338)
switch(g.d){case 0:case 1:s=g.f
if(s===1&&g.r===1)g.x=0
else if(s===4&&g.r===1)g.x=1
else if(B.a.P(s,8)===0){s=g.r
if(s===1)g.x=2
else if(s===2)g.x=3
else g.x=8}break
case 2:if(B.a.P(g.f,8)===0){s=g.r
if(s===3)g.x=5
else if(s===4)g.x=6
else g.x=8}break
case 3:if(g.r===1){s=g.f
s=s===4||s===8||s===16}else s=!1
if(s)g.x=4
break
case 4:if(g.f===1&&g.r===1)g.x=0
break
case 6:if(g.e===7&&g.f===8&&g.r===3)g.x=5
else{if(s.a2(530)){i=s.m(0,530).cC()
s=i.length
if(0>=s)return A.a(i,0)
m=g.Q=i[0]
if(1>=s)return A.a(i,1)
s=g.as=i[1]
h=m
m=s
s=h}else{g.as=g.Q=2
s=2
m=2}if(s*m===1)g.x=8
else if(g.f===8&&g.r===3)g.x=7}break
default:if(B.a.P(g.f,8)===0)g.x=8
break}},
bS(a){var s,r,q,p,o=this
o.k2=A.ak(o.b,o.c,B.i)
s=0
r=0
while(!0){q=o.cy
q===$&&A.c("tilesY")
if(!(s<q))break
p=0
while(!0){q=o.cx
q===$&&A.c("tilesX")
if(!(p<q))break
o.ft(a,p,s);++p;++r}++s}q=o.k2
q.toString
return q},
ft(c1,c2,c3){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,b0,b1,b2,b3,b4,b5,b6=this,b7=null,b8="colorMapRed",b9="colorMapGreen",c0="colorMapBlue"
if(b6.x===0){b6.fk(c1,c2,c3)
return}o=b6.cx
o===$&&A.c("tilesX")
n=c3*o+c2
o=b6.ch
if(!(n>=0&&n<o.length))return A.a(o,n)
c1.d=o[n]
o=b6.ax
m=c2*o
l=b6.ay
k=c3*l
j=b6.CW
if(!(n<j.length))return A.a(j,n)
s=j[n]
i=o*l*b6.r
o=b6.f
l=o===16
if(l)i*=2
else if(o===32)i*=4
r=null
if(o===8||l||o===32||o===64){o=b6.e
if(o===1)r=c1
else if(o===5){r=A.l(new Uint8Array(i),!1,b7,0)
q=A.kl()
try{q.dR(A.i(c1,s,0),r.a)}catch(h){p=A.a1(h)
A.jH(p)}if(b6.z===2)for(g=0;g<b6.ay;++g){f=b6.r
o=b6.ax
e=f*(g*o+1)
for(d=o*f;f<d;++f){o=r
l=o.a
o=o.d+e
if(!(o>=0&&o<l.length))return A.a(l,o)
j=l[o]
c=r
b=b6.r
a=c.a
b=c.d+(e-b)
if(!(b>=0&&b<a.length))return A.a(a,b)
J.m(l,o,j+a[b]);++e}}}else if(o===32773){r=A.l(new Uint8Array(i),!1,b7,0)
b6.d5(c1,i,r.a)}else if(o===32946){o=A.k7(c1.br(0,0,s)).c
r=A.l(t.L.a(A.N(o.c.buffer,0,o.a)),!1,b7,0)}else if(o===8)r=A.l(B.r.bh(A.bO(t.L.a(c1.br(0,0,s)),1,b7,0),!1),!1,b7,0)
else if(o===6){if(b6.k2==null)b6.k2=A.ak(b6.b,b6.c,B.i)
a0=new A.dU().a5(c1.br(0,0,s))
o=b6.k2
o.toString
b6.fW(a0,o,m,k,b6.ax,b6.ay)
if(b6.k3!=null){o=b6.k2
o.toString
l=new A.dB(A.H(t.dk,t.r))
l.eD(o,16,3)
b6.k3=l}return}else throw A.d(A.f("Unsupported Compression Type: "+o))
a1=k
a2=0
while(!0){if(!(a2<b6.ay&&a1<b6.c))break
a3=m
a4=0
while(!0){if(!(a4<b6.ax&&a3<b6.b))break
o=b6.r
if(o===1){o=b6.w
if(o===3){o=b6.f
if(o===32){o=r.j()
$.z()[0]=o
o=$.bb()
if(0>=o.length)return A.a(o,0)
a5=o[0]}else if(o===64)a5=r.bU()
else if(o===16){o=r.k()
if($.L==null)A.aD()
l=$.L
if(!(o<l.length))return A.a(l,o)
a5=l[o]}else a5=0
o=b6.k3
if(o!=null)o.aI(a3,a1,a5)
if(b6.k2!=null){a6=B.c.n(B.c.p(a5*255,0,255))
if(b6.d===3&&b6.fy!=null){o=b6.fy
o.toString
l=b6.go
l===$&&A.c(b8)
l+=a6
j=o.length
if(!(l>=0&&l<j))return A.a(o,l)
l=o[l]
c=b6.id
c===$&&A.c(b9)
c+=a6
if(!(c>=0&&c<j))return A.a(o,c)
c=o[c]
b=b6.k1
b===$&&A.c(c0)
b+=a6
if(!(b>=0&&b<j))return A.a(o,b)
b=o[b]
a7=(B.c.n(B.a.p(255,0,255))<<24|B.c.n(B.a.p(b,0,255))<<16|B.c.n(B.a.p(c,0,255))<<8|B.c.n(B.a.p(l,0,255)))>>>0}else a7=(B.c.n(B.a.p(255,0,255))<<24|B.c.n(B.a.p(a6,0,255))<<16|B.c.n(B.a.p(a6,0,255))<<8|B.c.n(B.a.p(a6,0,255)))>>>0
o=b6.k2
l=o.x
o=a1*o.a+a3
if(!(o>=0&&o<l.length))return A.a(l,o)
l[o]=a7}}else{l=b6.f
if(l===8)if(o===2){o=r
l=o.a
o=o.d++
if(!(o>=0&&o<l.length))return A.a(l,o)
o=l[o]
$.W()[0]=o
o=$.a3()
if(0>=o.length)return A.a(o,0)
a6=o[0]}else{o=r
l=o.a
o=o.d++
if(!(o>=0&&o<l.length))return A.a(l,o)
a6=l[o]}else if(l===16)if(o===2){o=r.k()
$.a2()[0]=o
o=$.a7()
if(0>=o.length)return A.a(o,0)
a6=o[0]}else a6=r.k()
else if(l===32)if(o===2){o=r.j()
$.z()[0]=o
o=$.M()
if(0>=o.length)return A.a(o,0)
a6=o[0]}else a6=r.j()
else a6=0
o=b6.k3
if(o!=null)o.aI(a3,a1,a6)
if(b6.k2!=null){o=b6.f
if(o===16)a6=B.a.i(a6,8)
else if(o===32)a6=B.a.i(a6,24)
o=b6.d
if(o===0)a6=255-a6
if(o===3&&b6.fy!=null){o=b6.fy
o.toString
l=b6.go
l===$&&A.c(b8)
l+=a6
j=o.length
if(!(l>=0&&l<j))return A.a(o,l)
l=o[l]
c=b6.id
c===$&&A.c(b9)
c+=a6
if(!(c>=0&&c<j))return A.a(o,c)
c=o[c]
b=b6.k1
b===$&&A.c(c0)
b+=a6
if(!(b>=0&&b<j))return A.a(o,b)
b=o[b]
a7=(B.c.n(B.a.p(255,0,255))<<24|B.c.n(B.a.p(b,0,255))<<16|B.c.n(B.a.p(c,0,255))<<8|B.c.n(B.a.p(l,0,255)))>>>0}else a7=(B.c.n(B.a.p(255,0,255))<<24|B.c.n(B.a.p(a6,0,255))<<16|B.c.n(B.a.p(a6,0,255))<<8|B.c.n(B.a.p(a6,0,255)))>>>0
o=b6.k2
l=o.x
o=a1*o.a+a3
if(!(o>=0&&o<l.length))return A.a(l,o)
l[o]=a7}}}else if(o===2){o=b6.f
if(o===8){o=b6.w===2
if(o){l=r
j=l.a
l=l.d++
if(!(l>=0&&l<j.length))return A.a(j,l)
l=j[l]
$.W()[0]=l
l=$.a3()
if(0>=l.length)return A.a(l,0)
a6=l[0]}else{l=r
j=l.a
l=l.d++
if(!(l>=0&&l<j.length))return A.a(j,l)
a6=j[l]}if(o){o=r
l=o.a
o=o.d++
if(!(o>=0&&o<l.length))return A.a(l,o)
o=l[o]
$.W()[0]=o
o=$.a3()
if(0>=o.length)return A.a(o,0)
a8=o[0]}else{o=r
l=o.a
o=o.d++
if(!(o>=0&&o<l.length))return A.a(l,o)
a8=l[o]}}else if(o===16){if(b6.w===2){o=r.k()
$.a2()[0]=o
o=$.a7()
if(0>=o.length)return A.a(o,0)
a6=o[0]}else a6=r.k()
if(b6.w===2){o=r.k()
$.a2()[0]=o
o=$.a7()
if(0>=o.length)return A.a(o,0)
a8=o[0]}else a8=r.k()}else if(o===32){if(b6.w===2){o=r.j()
$.z()[0]=o
o=$.M()
if(0>=o.length)return A.a(o,0)
a6=o[0]}else a6=r.j()
if(b6.w===2){o=r.j()
$.z()[0]=o
o=$.M()
if(0>=o.length)return A.a(o,0)
a8=o[0]}else a8=r.j()}else{a6=0
a8=0}o=b6.k3
if(o!=null){o.aI(a3,a1,a6)
b6.k3.b7(a3,a1,a8)}if(b6.k2!=null){o=b6.f
l=o===16
if(l)a6=B.a.i(a6,8)
else if(o===32)a6=B.a.i(a6,24)
if(l)a8=B.a.i(a8,8)
else if(o===32)a8=B.a.i(a8,24)
o=B.c.n(B.a.p(a8,0,255))
l=B.c.n(B.a.p(a6,0,255))
j=B.c.n(B.a.p(a6,0,255))
c=B.c.n(B.a.p(a6,0,255))
b=b6.k2
a=b.x
b=a1*b.a+a3
if(!(b>=0&&b<a.length))return A.a(a,b)
a[b]=(o<<24|l<<16|j<<8|c)>>>0}}else if(o===3){o=b6.w
if(o===3){o=b6.f
if(o===32){o=r.j()
l=$.z()
l[0]=o
o=$.bb()
if(0>=o.length)return A.a(o,0)
a9=o[0]
l[0]=r.j()
b0=o[0]
l[0]=r.j()
b1=o[0]}else if(o===64){a9=r.bU()
b0=0
b1=0}else if(o===16){o=r.k()
if($.L==null)A.aD()
l=$.L
if(!(o<l.length))return A.a(l,o)
a9=l[o]
o=r.k()
if($.L==null)A.aD()
l=$.L
if(!(o<l.length))return A.a(l,o)
b0=l[o]
o=r.k()
if($.L==null)A.aD()
l=$.L
if(!(o<l.length))return A.a(l,o)
b1=l[o]}else{a9=0
b0=0
b1=0}o=b6.k3
if(o!=null){o.aI(a3,a1,a9)
b6.k3.b7(a3,a1,b0)
b6.k3.bw(a3,a1,b1)}if(b6.k2!=null){b2=B.c.n(B.c.p(a9*255,0,255))
b3=B.c.n(B.c.p(b0*255,0,255))
b4=B.c.n(B.c.p(b1*255,0,255))
o=B.c.n(B.a.p(255,0,255))
l=B.c.n(B.a.p(b4,0,255))
j=B.c.n(B.a.p(b3,0,255))
c=B.c.n(B.a.p(b2,0,255))
b=b6.k2
a=b.x
b=a1*b.a+a3
if(!(b>=0&&b<a.length))return A.a(a,b)
a[b]=(o<<24|l<<16|j<<8|c)>>>0}}else{l=b6.f
if(l===8){o=o===2
if(o){l=r
j=l.a
l=l.d++
if(!(l>=0&&l<j.length))return A.a(j,l)
l=j[l]
$.W()[0]=l
l=$.a3()
if(0>=l.length)return A.a(l,0)
a9=l[0]}else{l=r
j=l.a
l=l.d++
if(!(l>=0&&l<j.length))return A.a(j,l)
a9=j[l]}if(o){l=r
j=l.a
l=l.d++
if(!(l>=0&&l<j.length))return A.a(j,l)
l=j[l]
$.W()[0]=l
l=$.a3()
if(0>=l.length)return A.a(l,0)
b0=l[0]}else{l=r
j=l.a
l=l.d++
if(!(l>=0&&l<j.length))return A.a(j,l)
b0=j[l]}if(o){o=r
l=o.a
o=o.d++
if(!(o>=0&&o<l.length))return A.a(l,o)
o=l[o]
$.W()[0]=o
o=$.a3()
if(0>=o.length)return A.a(o,0)
b1=o[0]}else{o=r
l=o.a
o=o.d++
if(!(o>=0&&o<l.length))return A.a(l,o)
b1=l[o]}}else if(l===16){if(o===2){o=r.k()
$.a2()[0]=o
o=$.a7()
if(0>=o.length)return A.a(o,0)
a9=o[0]}else a9=r.k()
if(b6.w===2){o=r.k()
$.a2()[0]=o
o=$.a7()
if(0>=o.length)return A.a(o,0)
b0=o[0]}else b0=r.k()
if(b6.w===2){o=r.k()
$.a2()[0]=o
o=$.a7()
if(0>=o.length)return A.a(o,0)
b1=o[0]}else b1=r.k()}else if(l===32){if(o===2){o=r.j()
$.z()[0]=o
o=$.M()
if(0>=o.length)return A.a(o,0)
a9=o[0]}else a9=r.j()
if(b6.w===2){o=r.j()
$.z()[0]=o
o=$.M()
if(0>=o.length)return A.a(o,0)
b0=o[0]}else b0=r.j()
if(b6.w===2){o=r.j()
$.z()[0]=o
o=$.M()
if(0>=o.length)return A.a(o,0)
b1=o[0]}else b1=r.j()}else{a9=0
b0=0
b1=0}o=b6.k3
if(o!=null){o.aI(a3,a1,a9)
b6.k3.b7(a3,a1,b0)
b6.k3.bw(a3,a1,b1)}if(b6.k2!=null){o=b6.f
l=o===16
if(l)a9=B.a.i(a9,8)
else if(o===32)a9=B.a.i(a9,24)
if(l)b0=B.a.i(b0,8)
else if(o===32)b0=B.a.i(b0,24)
if(l)b1=B.a.i(b1,8)
else if(o===32)b1=B.a.i(b1,24)
o=B.c.n(B.a.p(255,0,255))
l=B.c.n(B.a.p(b1,0,255))
j=B.c.n(B.a.p(b0,0,255))
c=B.c.n(B.a.p(a9,0,255))
b=b6.k2
a=b.x
b=a1*b.a+a3
if(!(b>=0&&b<a.length))return A.a(a,b)
a[b]=(o<<24|l<<16|j<<8|c)>>>0}}}else if(o>=4){o=b6.w
if(o===3){o=b6.f
if(o===32){o=r.j()
l=$.z()
l[0]=o
o=$.bb()
if(0>=o.length)return A.a(o,0)
a9=o[0]
l[0]=r.j()
b0=o[0]
l[0]=r.j()
b1=o[0]
l[0]=r.j()
b5=o[0]}else if(o===64){a9=r.bU()
b0=0
b1=0
b5=0}else if(o===16){o=r.k()
if($.L==null)A.aD()
l=$.L
if(!(o<l.length))return A.a(l,o)
a9=l[o]
o=r.k()
if($.L==null)A.aD()
l=$.L
if(!(o<l.length))return A.a(l,o)
b0=l[o]
o=r.k()
if($.L==null)A.aD()
l=$.L
if(!(o<l.length))return A.a(l,o)
b1=l[o]
o=r.k()
if($.L==null)A.aD()
l=$.L
if(!(o<l.length))return A.a(l,o)
b5=l[o]}else{a9=0
b0=0
b1=0
b5=0}o=b6.k3
if(o!=null){o.aI(a3,a1,a9)
b6.k3.b7(a3,a1,b0)
b6.k3.bw(a3,a1,b1)
b6.k3.cI(a3,a1,b5)}if(b6.k2!=null){b2=B.c.n(B.c.p(a9*255,0,255))
b3=B.c.n(B.c.p(b0*255,0,255))
b4=B.c.n(B.c.p(b1*255,0,255))
o=B.c.n(B.a.p(B.c.n(B.c.p(b5*255,0,255)),0,255))
l=B.c.n(B.a.p(b4,0,255))
j=B.c.n(B.a.p(b3,0,255))
c=B.c.n(B.a.p(b2,0,255))
b=b6.k2
a=b.x
b=a1*b.a+a3
if(!(b>=0&&b<a.length))return A.a(a,b)
a[b]=(o<<24|l<<16|j<<8|c)>>>0}}else{l=b6.f
if(l===8){o=o===2
if(o){l=r
j=l.a
l=l.d++
if(!(l>=0&&l<j.length))return A.a(j,l)
l=j[l]
$.W()[0]=l
l=$.a3()
if(0>=l.length)return A.a(l,0)
a9=l[0]}else{l=r
j=l.a
l=l.d++
if(!(l>=0&&l<j.length))return A.a(j,l)
a9=j[l]}if(o){l=r
j=l.a
l=l.d++
if(!(l>=0&&l<j.length))return A.a(j,l)
l=j[l]
$.W()[0]=l
l=$.a3()
if(0>=l.length)return A.a(l,0)
b0=l[0]}else{l=r
j=l.a
l=l.d++
if(!(l>=0&&l<j.length))return A.a(j,l)
b0=j[l]}if(o){l=r
j=l.a
l=l.d++
if(!(l>=0&&l<j.length))return A.a(j,l)
l=j[l]
$.W()[0]=l
l=$.a3()
if(0>=l.length)return A.a(l,0)
b1=l[0]}else{l=r
j=l.a
l=l.d++
if(!(l>=0&&l<j.length))return A.a(j,l)
b1=j[l]}if(o){o=r
l=o.a
o=o.d++
if(!(o>=0&&o<l.length))return A.a(l,o)
o=l[o]
$.W()[0]=o
o=$.a3()
if(0>=o.length)return A.a(o,0)
b5=o[0]}else{o=r
l=o.a
o=o.d++
if(!(o>=0&&o<l.length))return A.a(l,o)
b5=l[o]}}else if(l===16){if(o===2){o=r.k()
$.a2()[0]=o
o=$.a7()
if(0>=o.length)return A.a(o,0)
a9=o[0]}else a9=r.k()
if(b6.w===2){o=r.k()
$.a2()[0]=o
o=$.a7()
if(0>=o.length)return A.a(o,0)
b0=o[0]}else b0=r.k()
if(b6.w===2){o=r.k()
$.a2()[0]=o
o=$.a7()
if(0>=o.length)return A.a(o,0)
b1=o[0]}else b1=r.k()
if(b6.w===2){o=r.k()
$.a2()[0]=o
o=$.a7()
if(0>=o.length)return A.a(o,0)
b5=o[0]}else b5=r.k()}else if(l===32){if(o===2){o=r.j()
$.z()[0]=o
o=$.M()
if(0>=o.length)return A.a(o,0)
a9=o[0]}else a9=r.j()
if(b6.w===2){o=r.j()
$.z()[0]=o
o=$.M()
if(0>=o.length)return A.a(o,0)
b0=o[0]}else b0=r.j()
if(b6.w===2){o=r.j()
$.z()[0]=o
o=$.M()
if(0>=o.length)return A.a(o,0)
b1=o[0]}else b1=r.j()
if(b6.w===2){o=r.j()
$.z()[0]=o
o=$.M()
if(0>=o.length)return A.a(o,0)
b5=o[0]}else b5=r.j()}else{a9=0
b0=0
b1=0
b5=0}o=b6.k3
if(o!=null){o.aI(a3,a1,a9)
b6.k3.b7(a3,a1,b0)
b6.k3.bw(a3,a1,b1)
b6.k3.cI(a3,a1,b5)}if(b6.k2!=null){o=b6.f
l=o===16
if(l)a9=B.a.i(a9,8)
else if(o===32)a9=B.a.i(a9,24)
if(l)b0=B.a.i(b0,8)
else if(o===32)b0=B.a.i(b0,24)
if(l)b1=B.a.i(b1,8)
else if(o===32)b1=B.a.i(b1,24)
if(l)b5=B.a.i(b5,8)
else if(o===32)b5=B.a.i(b5,24)
o=B.c.n(B.a.p(b5,0,255))
l=B.c.n(B.a.p(b1,0,255))
j=B.c.n(B.a.p(b0,0,255))
c=B.c.n(B.a.p(a9,0,255))
b=b6.k2
a=b.x
b=a1*b.a+a3
if(!(b>=0&&b<a.length))return A.a(a,b)
a[b]=(o<<24|l<<16|j<<8|c)>>>0}}}++a4;++a3}++a2;++a1}}else throw A.d(A.f("Unsupported bitsPerSample: "+o))},
fW(a,b,c,d,e,f){var s,r,q,p,o,n,m,l,k,j,i,h
for(s=a.x,r=a.a,q=s.length,p=b.x,o=b.a,n=p.length,m=0;m<f;++m)for(l=m*r,k=(m+d)*o,j=0;j<e;++j){i=l+j
if(!(i>=0&&i<q))return A.a(s,i)
i=s[i]
h=k+(j+c)
if(!(h>=0&&h<n))return A.a(p,h)
p[h]=i}},
fk(b0,b1,b2){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5=this,a6=null,a7=4278190080,a8=4294967295,a9=a5.cx
a9===$&&A.c("tilesX")
r=b2*a9+b1
a9=a5.ch
if(!(r>=0&&r<a9.length))return A.a(a9,r)
b0.d=a9[r]
a9=a5.ax
q=b1*a9
p=a5.ay
o=b2*p
n=a5.CW
if(!(r<n.length))return A.a(n,r)
m=n[r]
s=null
n=a5.e
if(n===32773){l=B.a.P(a9,8)===0?B.a.F(a9,8)*p:(B.a.F(a9,8)+1)*p
s=A.l(new Uint8Array(a9*p),!1,a6,0)
a5.d5(b0,l,s.a)}else if(n===5){s=A.l(new Uint8Array(a9*p),!1,a6,0)
A.kl().dR(A.i(b0,m,0),s.a)
if(a5.z===2)for(k=0;k<a5.c;++k){j=a5.r
i=j*(k*a5.b+1)
for(;a9=a5.b,p=a5.r,j<a9*p;++j){a9=s
n=a9.a
a9=a9.d+i
if(!(a9>=0&&a9<n.length))return A.a(n,a9)
h=n[a9]
g=s
f=g.a
p=g.d+(i-p)
if(!(p>=0&&p<f.length))return A.a(f,p)
J.m(n,a9,h+f[p]);++i}}}else if(n===2){s=A.l(new Uint8Array(a9*p),!1,a6,0)
try{A.jg(a5.dx,a9,p).i6(s,b0,0,a5.ay)}catch(e){}}else if(n===3){s=A.l(new Uint8Array(a9*p),!1,a6,0)
try{A.jg(a5.dx,a9,p).i7(s,b0,0,a5.ay,a5.dy)}catch(e){}}else if(n===4){s=A.l(new Uint8Array(a9*p),!1,a6,0)
try{A.jg(a5.dx,a9,p).ib(s,b0,0,a5.ay,a5.fr)}catch(e){}}else if(n===8)s=A.l(B.r.bh(A.bO(t.L.a(b0.br(0,0,m)),1,a6,0),!1),!1,a6,0)
else if(n===32946){a9=A.k7(b0.br(0,0,m)).c
s=A.l(t.L.a(A.N(a9.c.buffer,0,a9.a)),!1,a6,0)}else if(n===1)s=b0
else throw A.d(A.f("Unsupported Compression Type: "+n))
d=new A.h9(s)
a9=a5.y
c=a9?a7:a8
b=a9?a8:a7
a=a5.k2
for(a9=a.x,p=a.a,n=a9.length,h=a.b,a0=o,a1=0;a1<a5.ay;++a1,++a0){for(g=a0*p,f=a0<h,a2=q,a3=0;a3<a5.ax;++a3,++a2){if(!f||a2>=p)break
a4=g+a2
if(d.K(1)===0){if(!(a4>=0&&a4<n))return A.a(a9,a4)
a9[a4]=b}else{if(!(a4>=0&&a4<n))return A.a(a9,a4)
a9[a4]=c}}d.c=0}},
d5(a,b,c){var s,r,q,p,o,n,m,l,k,j,i
t.L.a(c)
for(s=J.J(c),r=0,q=0;q<b;){p=r+1
o=a.a
n=a.d
m=n+r
l=o.length
if(!(m>=0&&m<l))return A.a(o,m)
m=o[m]
$.W()[0]=m
m=$.a3()
if(0>=m.length)return A.a(m,0)
k=m[0]
if(k>=0&&k<=127)for(o=k+1,r=p,j=0;j<o;++j,q=i,r=p){i=q+1
p=r+1
n=a.a
m=a.d+r
if(!(m>=0&&m<n.length))return A.a(n,m)
s.h(c,q,n[m])}else{m=k<=-1&&k>=-127
r=p+1
if(m){n+=p
if(!(n>=0&&n<l))return A.a(o,n)
n=o[n]
for(o=-k+1,j=0;j<o;++j,q=i){i=q+1
s.h(c,q,n)}}}}},
bI(a,b){var s=this.a
if(!s.a2(a))return b
return s.m(0,a).iM()},
aZ(a){return this.bI(a,0)},
bJ(a){var s=this.a
if(!s.a2(a))return null
return s.m(0,a).cC()},
se6(a){this.ch=t.T.a(a)},
se5(a){this.CW=t.T.a(a)},
shZ(a){this.fy=t.T.a(a)}}
A.hc.prototype={}
A.fC.prototype={
dR(a,b){var s,r,q,p,o,n,m,l,k=this,j="_out",i="_bufferLength"
t.L.a(b)
k.seQ(b)
s=b.length
k.w=0
r=t.D.a(a.a)
k.e=r
q=k.f=r.length
k.b=a.d
if(0>=q)return A.a(r,0)
if(r[0]===0){if(1>=q)return A.a(r,1)
r=r[1]===1}else r=!1
if(r)throw A.d(A.f("Invalid LZW Data"))
k.dj()
k.d=k.c=0
p=k.cd()
r=k.x
o=0
while(!0){if(!(p!==257&&k.w<s))break
if(p===256){k.dj()
p=k.cd()
k.as=0
if(p===257)break
q=k.r
q===$&&A.c(j)
J.m(q,k.w++,p)
o=p}else{q=k.Q
q.toString
if(p<q){k.df(p)
q=k.as
q===$&&A.c(i)
n=q-1
for(;n>=0;--n){q=k.r
q===$&&A.c(j)
m=k.w++
if(!(n<4096))return A.a(r,n)
J.m(q,m,r[n])}q=k.as-1
if(!(q>=0&&q<4096))return A.a(r,q)
k.cS(o,r[q])}else{k.df(o)
q=k.as
q===$&&A.c(i)
n=q-1
for(;n>=0;--n){q=k.r
q===$&&A.c(j)
m=k.w++
if(!(n<4096))return A.a(r,n)
J.m(q,m,r[n])}q=k.r
q===$&&A.c(j)
m=k.w++
l=k.as-1
if(!(l>=0&&l<4096))return A.a(r,l)
J.m(q,m,r[l])
l=k.as-1
if(!(l>=0&&l<4096))return A.a(r,l)
k.cS(o,r[l])}o=p}p=k.cd()}},
cS(a,b){var s,r=this,q=r.y
q===$&&A.c("_table")
s=r.Q
s.toString
if(!(s<4096))return A.a(q,s)
q[s]=b
q=r.z
q===$&&A.c("_prefix")
q[s]=a
s=r.Q=s+1
if(s===511)r.a=10
else if(s===1023)r.a=11
else if(s===2047)r.a=12},
df(a){var s,r,q,p,o,n,m,l=this
l.as=0
s=l.x
l.as=1
r=l.y
r===$&&A.c("_table")
if(!(a<4096))return A.a(r,a)
s[0]=r[a]
q=l.z
q===$&&A.c("_prefix")
p=q[a]
for(o=1;p!==4098;o=n){n=o+1
l.as=n
if(!(p>=0&&p<4096))return A.a(r,p)
m=r[p]
if(!(o<4096))return A.a(s,o)
s[o]=m
p=q[p]}},
cd(){var s,r,q,p,o=this,n=o.b,m=o.f
m===$&&A.c("_dataLength")
if(n>=m)return 257
for(;s=o.d,r=o.a,s<r;n=p){if(n>=m)return 257
r=o.c
q=o.e
q===$&&A.c("_data")
p=n+1
o.b=p
if(!(n>=0&&n<q.length))return A.a(q,n)
o.c=(r<<8>>>0)+q[n]>>>0
o.d=s+8}n=s-r
o.d=n
n=B.a.Z(o.c,n)
r-=9
if(!(r>=0&&r<4))return A.a(B.Z,r)
return n&B.Z[r]},
dj(){var s,r,q=this
q.y=new Uint8Array(4096)
s=new Uint32Array(4096)
q.z=s
B.q.a6(s,0,4096,4098)
for(s=q.y,r=0;r<256;++r)s[r]=r
q.a=9
q.Q=258},
seQ(a){this.r=t.L.a(a)}}
A.ha.prototype={
a5(a){var s=this,r=A.l(t.L.a(a),!1,null,0)
s.b=r
r=s.a=s.dA(r)
if(r==null)return null
r=r.r
if(0>=r.length)return A.a(r,0)
return r[0].bS(s.b)},
dA(a){var s,r,q,p,o,n,m,l,k,j=null,i=A.b([],t.aU),h=new A.hc(i),g=a.k()
if(g!==18761&&g!==19789)return j
if(g===19789)a.e=!0
else a.e=!1
q=a.k()
h.e=q
if(q!==42)return j
p=a.j()
s=A.i(a,j,0)
s.d=p
for(q=t.p,o=t.cV;p!==0;){r=null
try{n=new A.ex(A.H(q,o))
n.eK(s)
r=n
m=r
if(!(m.b!==0&&m.c!==0))break}catch(l){break}B.b.v(i,r)
m=i.length
if(m===1){if(0>=m)return A.a(i,0)
k=i[0]
h.a=k.b
if(0>=m)return A.a(i,0)
h.b=k.c}p=s.j()
if(p!==0)s.d=p}return i.length!==0?h:j}}
A.hi.prototype={
bi(){var s,r=this.a,q=r.a9()
if((q&1)!==0)return!1
if((q>>>1&7)>3)return!1
if((q>>>4&1)===0)return!1
this.f.d=q>>>5
if(r.a9()!==2752925)return!1
s=this.b
s.a=r.k()
s.b=r.k()
return!0},
ap(){var s,r=this
if(!r.fM())return null
s=r.b
r.d=A.ak(s.a,s.b,B.i)
r.fS()
if(!r.h6())return null
return r.d},
fM(){var s,r,q,p,o=this
if(!o.bi())return!1
o.fr=A.nx()
for(s=o.dy,r=0;r<4;++r){q=new Int32Array(2)
p=new Int32Array(2)
B.b.h(s,r,new A.eG(q,p,new Int32Array(2)))}s=o.b
q=s.a
if(typeof q!=="number")return q.X()
B.a.i(q,8)
s=s.b
if(typeof s!=="number")return s.X()
B.a.i(s,8)
o.y=o.Q=0
o.z=q
o.as=s
o.at=B.a.i(q+15,4)
o.ax=B.a.i(s+15,4)
o.k1=0
s=o.a
q=o.f
p=q.d
p===$&&A.c("partitionLength")
p=A.kL(s.N(p))
o.c=p
s.d+=q.d
p.C(1)
o.c.C(1)
o.hc(o.x,o.fr)
o.h5()
if(!o.h8(s))return!1
o.ha()
o.c.C(1)
o.h9()
return!0},
hc(a,b){var s,r,q,p=this,o=p.c
o===$&&A.c("br")
o=o.C(1)!==0
a.a=o
if(o){a.b=p.c.C(1)!==0
if(p.c.C(1)!==0){a.c=p.c.C(1)!==0
for(o=a.d,s=0;s<4;++s){if(p.c.C(1)!==0){r=p.c
q=r.C(7)
r=r.C(1)===1?-q:q}else r=0
o[s]=r}for(o=a.e,s=0;s<4;++s){if(p.c.C(1)!==0){r=p.c
q=r.C(6)
r=r.C(1)===1?-q:q}else r=0
o[s]=r}}if(a.b)for(s=0;s<3;++s){o=b.a
o[s]=p.c.C(1)!==0?p.c.C(8):255}}else a.b=!1
return!0},
h5(){var s,r,q,p=this,o=p.w,n=p.c
n===$&&A.c("br")
o.a=n.C(1)!==0
o.b=p.c.C(6)
o.c=p.c.C(3)
n=p.c.C(1)!==0
o.d=n
if(n)if(p.c.C(1)!==0){for(n=o.e,s=0;s<4;++s)if(p.c.C(1)!==0){r=p.c
q=r.C(6)
n[s]=r.C(1)===1?-q:q}for(n=o.f,s=0;s<4;++s)if(p.c.C(1)!==0){r=p.c
q=r.C(6)
n[s]=r.C(1)===1?-q:q}}if(o.b===0)n=0
else n=o.a?1:2
p.aP=n
return!0},
h8(a){var s,r,q,p,o,n,m,l,k,j,i,h=a.c-a.d,g=this.c
g===$&&A.c("br")
g=B.a.A(1,g.C(2))
this.cy=g
s=g-1
r=s*3
if(h<r)return!1
for(g=this.db,q=0,p=0;p<s;++p,r=i){o=a.aT(3,q)
n=o.a
m=o.d
l=n.length
if(!(m>=0&&m<l))return A.a(n,m)
k=n[m]
j=m+1
if(!(j<l))return A.a(n,j)
j=n[j]
m+=2
if(!(m<l))return A.a(n,m)
i=r+((k|j<<8|n[m]<<16)>>>0)
if(i>h)i=h
n=new A.cL(a.aJ(i-r,r))
n.b=254
n.c=0
n.d=-8
B.b.h(g,p,n)
q+=3}B.b.h(g,s,A.kL(a.aJ(h-r,a.d-a.b+r)))
return r<h},
ha(){var s,r,q,p,o,n,m,l,k,j,i,h,g,f=this,e=f.c
e===$&&A.c("br")
s=e.C(7)
r=f.c.C(1)!==0?f.c.b6(4):0
q=f.c.C(1)!==0?f.c.b6(4):0
p=f.c.C(1)!==0?f.c.b6(4):0
o=f.c.C(1)!==0?f.c.b6(4):0
n=f.c.C(1)!==0?f.c.b6(4):0
m=f.x
for(e=f.dy,l=m.d,k=0;k<4;++k){if(m.a){j=l[k]
if(!m.c)j+=s}else{if(k>0){i=e[0]
if(!(k>=0&&k<4))return A.a(e,k)
e[k]=i
continue}j=s}h=e[k]
i=h.a
g=j+r
if(g<0)g=0
else if(g>127)g=127
i[0]=B.J[g]
if(j<0)g=0
else g=j>127?127:j
i[1]=B.K[g]
g=h.b
i=j+q
if(i<0)i=0
else if(i>127)i=127
g[0]=B.J[i]*2
i=j+p
if(i<0)i=0
else if(i>127)i=127
g[1]=B.K[i]*101581>>>16
if(g[1]<8)g[1]=8
i=h.c
g=j+o
if(g<0)g=0
else if(g>117)g=117
i[0]=B.J[g]
g=j+n
if(g<0)g=0
else if(g>127)g=127
i[1]=B.K[g]}},
h9(){var s,r,q,p,o,n,m=this,l=m.fr
for(s=0;s<4;++s)for(r=0;r<8;++r)for(q=0;q<3;++q)for(p=0;p<11;++p){o=m.c
o===$&&A.c("br")
n=o.G(B.bO[s][r][q][p])!==0?m.c.C(8):B.c4[s][r][q][p]
o=l.b
if(!(s<o.length))return A.a(o,s)
o=o[s]
if(!(r<o.length))return A.a(o,r)
o=o[r].a
if(!(q<o.length))return A.a(o,q)
o[q][p]=n}o=m.c
o===$&&A.c("br")
o=o.C(1)!==0
m.fx=o
if(o)m.fy=m.c.C(8)},
hf(){var s,r,q,p,o,n,m,l,k,j,i,h,g=this,f=g.aP
f.toString
if(f>0){s=g.w
for(f=s.e,r=s.f,q=g.x,p=q.e,o=0;o<4;++o){if(q.a){n=p[o]
if(!q.c){m=s.b
m.toString
n+=m}}else n=s.b
for(l=0;l<=1;++l){m=g.cv
m===$&&A.c("_fStrengths")
if(!(o<m.length))return A.a(m,o)
k=m[o][l]
m=s.d
m===$&&A.c("useLfDelta")
if(m){n.toString
j=n+f[0]
if(l!==0)j+=r[0]}else j=n
j.toString
if(j<0)j=0
else if(j>63)j=63
if(j>0){m=s.c
m===$&&A.c("sharpness")
if(m>0){i=m>4?B.a.i(j,2):B.a.i(j,1)
h=9-m
if(i>h)i=h}else i=j
if(i<1)i=1
k.b=i
k.a=2*j+i
if(j>=40)m=2
else m=j>=15?1:0
k.d=m}else k.a=0
k.c=l!==0}}}},
fS(){var s,r,q,p,o,n,m,l,k,j,i,h=this,g=null,f=h.b,e=f.at
if(e!=null)h.cw=e
s=J.a9(4,t.e6)
for(e=t.ao,r=0;r<4;++r)s[r]=A.b([new A.aK(),new A.aK()],e)
h.seW(t.gS.a(s))
e=h.at
e.toString
s=J.a9(e,t.dE)
for(q=0;q<e;++q){p=new Uint8Array(16)
o=new Uint8Array(8)
s[q]=new A.cP(p,o,new Uint8Array(8))}h.seZ(t.cC.a(s))
h.ok=new Uint8Array(832)
e=h.at
e.toString
h.go=new Uint8Array(4*e)
p=h.p4=16*e
o=h.R8=8*e
n=h.aP
n.toString
if(!(n<3))return A.a(B.w,n)
m=B.w[n]
l=m*p
k=(m/2|0)*o
h.p1=A.l(new Uint8Array(16*p+l),!1,g,l)
p=8*o+k
h.p2=A.l(new Uint8Array(p),!1,g,k)
h.p3=A.l(new Uint8Array(p),!1,g,k)
f=f.a
h.RG=A.l(new Uint8Array(f),!1,g,0)
j=B.a.i(f+1,1)
h.rx=A.l(new Uint8Array(j),!1,g,0)
h.ry=A.l(new Uint8Array(j),!1,g,0)
if(n===2)h.ch=h.ay=0
else{f=h.y
f===$&&A.c("_cropLeft")
f=B.a.F(f-m,16)
h.ay=f
p=h.Q
p.toString
p=B.a.F(p-m,16)
h.ch=p
if(f<0)h.ay=0
if(p<0)h.ch=0}f=h.as
f.toString
f=B.a.F(f+15+m,16)
h.cx=f
p=h.z
p===$&&A.c("_cropRight")
p=B.a.F(p+15+m,16)
h.CW=p
if(p>e)h.CW=e
p=h.ax
p.toString
if(f>p)h.cx=p
i=e+1
s=J.a9(i,t.ai)
for(q=0;q<i;++q)s[q]=new A.cN()
h.seY(t.eQ.a(s))
f=h.at
f.toString
s=J.a9(f,t.gT)
for(q=0;q<f;++q){e=new Int16Array(384)
s[q]=new A.cO(e,new Uint8Array(16))}h.seX(t.db.a(s))
f=h.at
f.toString
h.seV(t.ge.a(A.U(f,g,!1,t.aj)))
h.hf()
A.ni()
h.e=new A.hj()
return!0},
h6(){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e=this,d="isIntra4x4"
e.y2=0
s=e.id
r=e.x
q=e.db
p=0
while(!0){o=e.cx
o.toString
if(!(p<o))break
o=e.cy
o===$&&A.c("_numPartitions")
o=(p&o-1)>>>0
if(!(o>=0&&o<8))return A.a(q,o)
n=q[o]
while(!0){p=e.y1
o=e.at
o.toString
if(!(p<o))break
o=e.k3
o===$&&A.c("_mbInfo")
m=o.length
if(0>=m)return A.a(o,0)
l=o[0]
k=1+p
if(!(k<m))return A.a(o,k)
j=o[k]
k=e.bj
k===$&&A.c("_mbData")
if(!(p<k.length))return A.a(k,p)
i=k[p]
if(r.b){p=e.c
p===$&&A.c("br")
p=p.G(e.fr.a[0])
o=e.c
m=e.fr
e.k1=p===0?o.G(m.a[1]):2+o.G(m.a[2])}p=e.fx
p===$&&A.c("_useSkipProba")
if(p){p=e.c
p===$&&A.c("br")
o=e.fy
o===$&&A.c("_skipP")
h=p.G(o)!==0}else h=!1
e.h7()
if(!h)h=e.hb(j,n)
else{l.a=j.a=0
p=i.b
p===$&&A.c(d)
if(!p)l.b=j.b=0
i.f=i.e=0}p=e.aP
p.toString
if(p>0){p=e.k4
p===$&&A.c("_fInfo")
o=e.y1
m=e.cv
m===$&&A.c("_fStrengths")
k=e.k1
k===$&&A.c("_segment")
if(!(k<m.length))return A.a(m,k)
k=m[k]
m=i.b
m===$&&A.c(d)
B.b.h(p,o,k[m?1:0])
p=e.k4
o=e.y1
if(!(o<p.length))return A.a(p,o)
g=p[o]
g.c=g.c||!h}++e.y1}p=e.k3
p===$&&A.c("_mbInfo")
if(0>=p.length)return A.a(p,0)
l=p[0]
l.b=l.a=0
B.d.a6(s,0,4,0)
e.y1=0
e.hJ()
p=e.aP
p.toString
if(p>0){p=e.y2
o=e.ch
o===$&&A.c("_tlMbY")
if(p>=o){o=e.cx
o.toString
o=p<=o
f=o}else f=!1}else f=!1
if(!e.fJ(f))return!1
p=++e.y2}return!0},
hJ(){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3=this,a4=null,a5="_dsp",a6=a3.y2,a7=a3.ok
a7===$&&A.c("_yuvBlock")
s=A.l(a7,!1,a4,40)
r=A.l(a7,!1,a4,584)
q=A.l(a7,!1,a4,600)
a7=a6>0
p=0
while(!0){o=a3.at
o.toString
if(!(p<o))break
o=a3.bj
o===$&&A.c("_mbData")
if(!(p<o.length))return A.a(o,p)
n=o[p]
if(p>0){for(m=-1;m<16;++m){o=m*32
s.a8(o-4,4,s,o+12)}for(m=-1;m<8;++m){o=m*32
l=o-4
o+=4
r.a8(l,4,r,o)
q.a8(l,4,q,o)}}else{for(m=0;m<16;++m)J.m(s.a,s.d+(m*32-1),129)
for(m=0;m<8;++m){o=m*32-1
J.m(r.a,r.d+o,129)
J.m(q.a,q.d+o,129)}if(a7){J.m(q.a,q.d+-33,129)
J.m(r.a,r.d+-33,129)
J.m(s.a,s.d+-33,129)}}o=a3.k2
o===$&&A.c("_yuvT")
if(!(p<o.length))return A.a(o,p)
k=o[p]
j=n.a
i=n.e
if(a7){s.aF(-32,16,k.a)
r.aF(-32,8,k.b)
q.aF(-32,8,k.c)}else if(p===0){o=s.a
l=s.d+-33
J.ax(o,l,l+21,127)
l=r.a
o=r.d+-33
J.ax(l,o,o+9,127)
o=q.a
l=q.d+-33
J.ax(o,l,l+9,127)}o=n.b
o===$&&A.c("isIntra4x4")
if(o){h=A.i(s,a4,-16)
g=h.bs()
if(a7){o=a3.at
o.toString
if(p>=o-1){o=k.a[15]
l=h.a
f=h.d
J.ax(l,f,f+4,o)}else{o=a3.k2
l=p+1
if(!(l<o.length))return A.a(o,l)
h.aF(0,4,o[l].a)}}o=g.length
if(0>=o)return A.a(g,0)
e=g[0]
if(96>=o)return A.a(g,96)
g[96]=e
g[64]=e
g[32]=e
for(o=n.c,d=0;d<16;++d,i=i<<2>>>0){c=A.i(s,a4,B.a7[d])
l=o[d]
if(!(l<10))return A.a(B.ai,l)
B.ai[l].$1(c)
i.toString
l=d*16
a3.d6(i,new A.Y(j,l,384,l,!1),c)}}else{o=A.kO(p,a6,n.c[0])
o.toString
if(!(o<7))return A.a(B.a0,o)
B.a0[o].$1(s)
if(i!==0)for(d=0;d<16;++d,i=i<<2>>>0){c=A.i(s,a4,B.a7[d])
i.toString
o=d*16
a3.d6(i,new A.Y(j,o,384,o,!1),c)}}o=n.f
o===$&&A.c("nonZeroUV")
l=A.kO(p,a6,n.d)
l.toString
if(!(l<7))return A.a(B.H,l)
B.H[l].$1(r)
B.H[l].$1(q)
b=new A.Y(j,256,384,256,!1)
if((o&255)!==0){l=a3.e
if((o&170)!==0){l===$&&A.c(a5)
l.al(b,r)
l.al(A.i(b,a4,16),A.i(r,a4,4))
f=A.i(b,a4,32)
a=A.i(r,a4,128)
l.al(f,a)
l.al(A.i(f,a4,16),A.i(a,a4,4))}else{l===$&&A.c(a5)
l.e9(b,r)}}a0=new A.Y(j,320,384,320,!1)
o=o>>>8
if((o&255)!==0){l=a3.e
if((o&170)!==0){l===$&&A.c(a5)
l.al(a0,q)
l.al(A.i(a0,a4,16),A.i(q,a4,4))
o=A.i(a0,a4,32)
f=A.i(q,a4,128)
l.al(o,f)
l.al(A.i(o,a4,16),A.i(f,a4,4))}else{l===$&&A.c(a5)
l.e9(a0,q)}}o=a3.ax
o.toString
if(a6<o-1){B.d.W(k.a,0,16,s.S(),480)
B.d.W(k.b,0,8,r.S(),224)
B.d.W(k.c,0,8,q.S(),224)}a1=p*16
a2=p*8
for(m=0;m<16;++m){o=a3.p4
o.toString
l=a3.p1
l===$&&A.c("_cacheY")
l.a8(a1+m*o,16,s,m*32)}for(m=0;m<8;++m){o=a3.R8
o.toString
l=a3.p2
l===$&&A.c("_cacheU")
f=m*32
l.a8(a2+m*o,8,r,f)
o=a3.R8
o.toString
l=a3.p3
l===$&&A.c("_cacheV")
l.a8(a2+m*o,8,q,f)}++p}},
d6(a,b,c){var s,r,q,p,o,n,m,l,k="_dsp"
switch(a>>>30){case 3:s=this.e
s===$&&A.c(k)
s.iY(b,c,!1)
break
case 2:this.e===$&&A.c(k)
s=b.a
r=b.d
q=s.length
if(!(r>=0&&r<q))return A.a(s,r)
p=s[r]+4
r+=4
if(!(r<q))return A.a(s,r)
o=B.a.R(B.a.i(s[r]*35468,16),32)
r=b.a
s=b.d+4
if(!(s>=0&&s<r.length))return A.a(r,s)
n=B.a.R(B.a.i(r[s]*85627,16),32)
s=b.a
r=b.d+1
if(!(r>=0&&r<s.length))return A.a(s,r)
m=B.a.R(B.a.i(s[r]*35468,16),32)
r=b.a
s=b.d+1
if(!(s>=0&&s<r.length))return A.a(r,s)
l=B.a.R(B.a.i(r[s]*85627,16),32)
A.hn(c,0,p+n,l,m)
A.hn(c,1,p+o,l,m)
A.hn(c,2,p-o,l,m)
A.hn(c,3,p-n,l,m)
break
case 1:s=this.e
s===$&&A.c(k)
s.bt(b,c)
break
default:break}},
fA(a,b){var s,r,q,p,o,n,m,l,k,j,i,h=this,g=null,f="_dsp",e=h.p4,d=h.k4
d===$&&A.c("_fInfo")
if(!(a>=0&&a<d.length))return A.a(d,a)
d=d[a]
d.toString
s=h.p1
s===$&&A.c("_cacheY")
r=A.i(s,g,a*16)
q=d.b
p=d.a
if(p===0)return
if(h.aP===1){if(a>0){s=h.e
s===$&&A.c(f)
e.toString
s.cK(r,e,p+4)}if(d.c){s=h.e
s===$&&A.c(f)
e.toString
s.ej(r,e,p)}if(b>0){s=h.e
s===$&&A.c(f)
e.toString
s.cL(r,e,p+4)}if(d.c){d=h.e
d===$&&A.c(f)
e.toString
d.ek(r,e,p)}}else{o=h.R8
s=h.p2
s===$&&A.c("_cacheU")
n=a*8
m=A.i(s,g,n)
s=h.p3
s===$&&A.c("_cacheV")
l=A.i(s,g,n)
k=d.d
if(a>0){s=h.e
s===$&&A.c(f)
e.toString
n=p+4
s.aW(r,1,e,16,n,q,k)
s=h.e
o.toString
s.aW(m,1,o,8,n,q,k)
s.aW(l,1,o,8,n,q,k)}if(d.c){s=h.e
s===$&&A.c(f)
e.toString
s.il(r,e,p,q,k)
s=h.e
o.toString
j=A.i(m,g,4)
i=A.i(l,g,4)
s.aV(j,1,o,8,p,q,k)
s.aV(i,1,o,8,p,q,k)}if(b>0){s=h.e
s===$&&A.c(f)
e.toString
n=p+4
s.aW(r,e,1,16,n,q,k)
s=h.e
o.toString
s.aW(m,o,1,8,n,q,k)
s.aW(l,o,1,8,n,q,k)}if(d.c){d=h.e
d===$&&A.c(f)
e.toString
d.j1(r,e,p,q,k)
d=h.e
o.toString
s=4*o
j=A.i(m,g,s)
i=A.i(l,g,s)
d.aV(j,o,1,8,p,q,k)
d.aV(i,o,1,8,p,q,k)}}},
fI(){var s,r=this,q=r.ay
q===$&&A.c("_tlMbX")
s=q
while(!0){q=r.CW
q.toString
if(!(s<q))break
r.fA(s,r.y2);++s}},
fJ(a1){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b=this,a=null,a0=b.aP
a0.toString
if(!(a0<3))return A.a(B.w,a0)
s=B.w[a0]
a0=b.p4
a0.toString
r=s*a0
a0=b.R8
a0.toString
q=(s/2|0)*a0
a0=b.p1
a0===$&&A.c("_cacheY")
p=-r
o=A.i(a0,a,p)
a0=b.p2
a0===$&&A.c("_cacheU")
n=-q
m=A.i(a0,a,n)
a0=b.p3
a0===$&&A.c("_cacheV")
l=A.i(a0,a,n)
k=b.y2
a0=b.cx
a0.toString
j=k*16
i=(k+1)*16
if(a1)b.fI()
if(k!==0){j-=s
b.to=A.i(o,a,0)
b.x1=A.i(m,a,0)
b.x2=A.i(l,a,0)}else{b.to=A.i(b.p1,a,0)
b.x1=A.i(b.p2,a,0)
b.x2=A.i(b.p3,a,0)}a0=k<a0-1
if(a0)i-=s
h=b.as
h.toString
if(i>h)i=h
b.xr=null
if(b.cw!=null&&j<i){h=b.xr=b.fu(j,i-j)
if(h==null)return!1}else h=a
g=b.Q
g.toString
if(j<g){f=g-j
e=b.to
e===$&&A.c("_y")
d=e.d
c=b.p4
c.toString
e.d=d+c*f
c=b.x1
c===$&&A.c("_u")
d=c.d
e=b.R8
e.toString
e*=B.a.i(f,1)
c.d=d+e
d=b.x2
d===$&&A.c("_v")
d.d+=e
if(h!=null){e=h.d
d=b.b.a
if(typeof d!=="number")return d.af()
h.d=e+d*f}j=g}if(j<i){e=b.to
e===$&&A.c("_y")
d=e.d
c=b.y
c===$&&A.c("_cropLeft")
e.d=d+c
d=b.x1
d===$&&A.c("_u")
e=c>>>1
d.d=d.d+e
d=b.x2
d===$&&A.c("_v")
d.d+=e
if(h!=null)h.d+=c
h=b.z
h===$&&A.c("_cropRight")
b.hk(j-g,h-c,i-j)}if(a0){a0=b.p1
h=b.p4
h.toString
a0.a8(p,r,o,16*h)
h=b.p2
p=b.R8
p.toString
h.a8(n,q,m,8*p)
p=b.p3
h=b.R8
h.toString
p.a8(n,q,l,8*h)}return!0},
hk(a,b,c){if(b<=0||c<=0)return!1
this.fC(a,b,c)
this.fB(a,b,c)
return!0},
c1(a){var s
if((a&-4194304)>>>0===0)s=B.a.i(a,14)
else s=a<0?0:255
return s},
bO(a,b,c,d){var s=19077*a
d.h(0,0,this.c1(s+26149*c+-3644112))
d.h(0,1,this.c1(s-6419*b-13320*c+2229552))
d.h(0,2,this.c1(s+33050*b+-4527440))},
bN(a6,a7,a8,a9,b0,b1,b2,b3,b4){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a=this,a0=null,a1=new A.hv(),a2=b4-1,a3=B.a.i(a2,1),a4=a8.a,a5=a8.d
if(!(a5>=0&&a5<a4.length))return A.a(a4,a5)
a5=a4[a5]
a4=a9.a
s=a9.d
if(!(s>=0&&s<a4.length))return A.a(a4,s)
r=a1.$2(a5,a4[s])
s=b0.a
a4=b0.d
if(!(a4>=0&&a4<s.length))return A.a(s,a4)
a4=s[a4]
s=b1.a
a5=b1.d
if(!(a5>=0&&a5<s.length))return A.a(s,a5)
q=a1.$2(a4,s[a5])
p=B.a.i(3*r+q+131074,2)
a5=a6.a
s=a6.d
if(!(s>=0&&s<a5.length))return A.a(a5,s)
a.bO(a5[s],p&255,p>>>16,b2)
b2.h(0,3,255)
a4=a7!=null
if(a4){p=B.a.i(3*q+r+131074,2)
a5=a7.a
s=a7.d
if(!(s>=0&&s<a5.length))return A.a(a5,s)
s=a5[s]
b3.toString
a.bO(s,p&255,p>>>16,b3)
b3.h(0,3,255)}for(o=1;o<=a3;++o,q=l,r=m){a5=a8.a
s=a8.d+o
if(!(s>=0&&s<a5.length))return A.a(a5,s)
s=a5[s]
a5=a9.a
n=a9.d+o
if(!(n>=0&&n<a5.length))return A.a(a5,n)
m=a1.$2(s,a5[n])
n=b0.a
a5=b0.d+o
if(!(a5>=0&&a5<n.length))return A.a(n,a5)
a5=n[a5]
n=b1.a
s=b1.d+o
if(!(s>=0&&s<n.length))return A.a(n,s)
l=a1.$2(a5,n[s])
k=r+m+q+l+524296
j=B.a.i(k+2*(m+q),3)
i=B.a.i(k+2*(r+l),3)
p=B.a.i(j+r,1)
h=B.a.i(i+m,1)
s=2*o
n=s-1
a5=a6.a
g=a6.d+n
if(!(g>=0&&g<a5.length))return A.a(a5,g)
g=a5[g]
a5=p&255
f=p>>>16
e=n*4
d=A.i(b2,a0,e)
g=19077*g
c=g+26149*f+-3644112
if((c&-4194304)>>>0===0)b=B.a.i(c,14)
else b=c<0?0:255
J.m(d.a,d.d,b)
f=g-6419*a5-13320*f+2229552
if((f&-4194304)>>>0===0)b=B.a.i(f,14)
else b=f<0?0:255
J.m(d.a,d.d+1,b)
a5=g+33050*a5+-4527440
if((a5&-4194304)>>>0===0)b=B.a.i(a5,14)
else b=a5<0?0:255
J.m(d.a,d.d+2,b)
J.m(d.a,d.d+3,255)
a5=s-0
g=a6.a
f=a6.d+a5
if(!(f>=0&&f<g.length))return A.a(g,f)
f=g[f]
g=h&255
d=h>>>16
a5=A.i(b2,a0,a5*4)
f=19077*f
c=f+26149*d+-3644112
if((c&-4194304)>>>0===0)b=B.a.i(c,14)
else b=c<0?0:255
J.m(a5.a,a5.d,b)
d=f-6419*g-13320*d+2229552
if((d&-4194304)>>>0===0)b=B.a.i(d,14)
else b=d<0?0:255
J.m(a5.a,a5.d+1,b)
g=f+33050*g+-4527440
if((g&-4194304)>>>0===0)b=B.a.i(g,14)
else b=g<0?0:255
J.m(a5.a,a5.d+2,b)
J.m(a5.a,a5.d+3,255)
if(a4){p=B.a.i(i+q,1)
h=B.a.i(j+l,1)
a5=a7.a
n=a7.d+n
if(!(n>=0&&n<a5.length))return A.a(a5,n)
n=a5[n]
a5=p&255
g=p>>>16
b3.toString
e=A.i(b3,a0,e)
n=19077*n
f=n+26149*g+-3644112
if((f&-4194304)>>>0===0)b=B.a.i(f,14)
else b=f<0?0:255
J.m(e.a,e.d,b)
g=n-6419*a5-13320*g+2229552
if((g&-4194304)>>>0===0)b=B.a.i(g,14)
else b=g<0?0:255
J.m(e.a,e.d+1,b)
a5=n+33050*a5+-4527440
if((a5&-4194304)>>>0===0)b=B.a.i(a5,14)
else b=a5<0?0:255
J.m(e.a,e.d+2,b)
J.m(e.a,e.d+3,255)
a5=a7.a
n=a7.d+s
if(!(n>=0&&n<a5.length))return A.a(a5,n)
n=a5[n]
a5=h&255
g=h>>>16
s=A.i(b3,a0,s*4)
n=19077*n
f=n+26149*g+-3644112
if((f&-4194304)>>>0===0)b=B.a.i(f,14)
else b=f<0?0:255
J.m(s.a,s.d,b)
g=n-6419*a5-13320*g+2229552
if((g&-4194304)>>>0===0)b=B.a.i(g,14)
else b=g<0?0:255
J.m(s.a,s.d+1,b)
a5=n+33050*a5+-4527440
if((a5&-4194304)>>>0===0)b=B.a.i(a5,14)
else b=a5<0?0:255
J.m(s.a,s.d+2,b)
J.m(s.a,s.d+3,255)}}if((b4&1)===0){p=B.a.i(3*r+q+131074,2)
a5=a6.a
s=a6.d+a2
if(!(s>=0&&s<a5.length))return A.a(a5,s)
s=a5[s]
a5=a2*4
n=A.i(b2,a0,a5)
a.bO(s,p&255,p>>>16,n)
n.h(0,3,255)
if(a4){p=B.a.i(3*q+r+131074,2)
a4=a7.a
a2=a7.d+a2
if(!(a2>=0&&a2<a4.length))return A.a(a4,a2)
a2=a4[a2]
b3.toString
a5=A.i(b3,a0,a5)
a.bO(a2,p&255,p>>>16,a5)
a5.h(0,3,255)}}},
fB(a,b,c){var s,r,q,p,o,n,m,l,k,j=this,i=j.xr
if(i==null)return
s=j.b
r=s.a
if(typeof r!=="number")return r.af()
q=r*4
p=A.i(i,null,0)
if(a===0){o=c-1
n=a}else{n=a-1
p.d-=r
o=c}m=A.l(j.d.aH(),!1,null,n*q+3)
i=j.Q
i.toString
r=j.as
if(i+a+c===r){r.toString
o=r-i-n}for(l=0;l<o;++l){for(k=0;k<b;++k){i=p.a
r=p.d+k
if(!(r>=0&&r<i.length))return A.a(i,r)
r=i[r]
J.m(m.a,m.d+4*k,r&255)}i=p.d
r=s.a
if(typeof r!=="number")return A.P(r)
p.d=i+r
m.d+=q}},
fC(a,b,a0){var s,r,q,p,o,n,m,l,k,j,i,h,g,f=this,e=null,d=f.d.aH(),c=f.b.a
if(typeof c!=="number")return A.P(c)
s=A.l(d,!1,e,a*c*4)
d=f.to
d===$&&A.c("_y")
r=A.i(d,e,0)
d=f.x1
d===$&&A.c("_u")
q=A.i(d,e,0)
d=f.x2
d===$&&A.c("_v")
p=A.i(d,e,0)
o=a+a0
n=B.a.i(b+1,1)
m=c*4
c=f.rx
c===$&&A.c("_tmpU")
l=A.i(c,e,0)
c=f.ry
c===$&&A.c("_tmpV")
k=A.i(c,e,0)
if(a===0){f.bN(r,e,q,p,q,p,s,e,b)
j=a0}else{d=f.RG
d===$&&A.c("_tmpY")
f.bN(d,r,l,k,q,p,A.i(s,e,-m),s,b)
j=a0+1}l.scq(0,q.a)
k.scq(0,p.a)
for(d=2*m,c=-m,i=a;i+=2,i<o;){l.d=q.d
k.d=p.d
h=q.d
g=f.R8
g.toString
q.d=h+g
p.d+=g
s.d+=d
g=r.d
h=f.p4
h.toString
r.d=g+2*h
f.bN(A.i(r,e,-h),r,l,k,q,p,A.i(s,e,c),s,b)}d=r.d
c=f.p4
c.toString
r.d=d+c
d=f.Q
d.toString
c=f.as
c.toString
if(d+o<c){d=f.RG
d===$&&A.c("_tmpY")
d.aF(0,b,r)
f.rx.aF(0,n,q)
f.ry.aF(0,n,p);--j}else if((o&1)===0)f.bN(r,e,q,p,q,p,A.i(s,e,m),e,b)
return j},
fu(a,b){var s,r,q,p,o,n,m,l,k,j,i=this,h=null,g="_alphaPlane",f=i.b,e=f.a,d=f.b
if(a<0||b<=0||a+b>d)return h
if(a===0){f=e*d
i.cz=new Uint8Array(f)
s=i.cw
r=new A.hw(s,e,d)
q=s.q()
r.d=q&3
r.e=B.a.i(q,2)&3
r.f=B.a.i(q,4)&3
r.r=B.a.i(q,6)&3
if(r.gdZ()){p=r.d
if(p===0){if(s.c-s.d<f)r.r=1}else if(p===1){o=new A.cR(A.b([],t.J))
o.a=e
o.b=d
f=A.b([],t.V)
p=A.b([],t.i)
n=new Uint32Array(2)
m=new A.eE(s,n)
n=m.d=A.N(n.buffer,0,h)
l=s.q()
k=n.length
if(0>=k)return A.a(n,0)
n[0]=l
l=s.q()
if(1>=k)return A.a(n,1)
n[1]=l
l=s.q()
if(2>=k)return A.a(n,2)
n[2]=l
l=s.q()
if(3>=k)return A.a(n,3)
n[3]=l
l=s.q()
if(4>=k)return A.a(n,4)
n[4]=l
l=s.q()
if(5>=k)return A.a(n,5)
n[5]=l
l=s.q()
if(6>=k)return A.a(n,6)
n[6]=l
s=s.q()
if(7>=k)return A.a(n,7)
n[7]=s
p=r.x=new A.dR(m,o,f,p)
p.db=e
p.ba(e,d,!0)
f=r.x
s=f.ax
p=s.length
if(p===1){if(0>=p)return A.a(s,0)
f=s[0].a===3&&f.fU()}else f=!1
if(f){r.y=!0
f=r.x
s=f.c
p=s.a
s=s.b
if(typeof p!=="number")return p.af()
if(typeof s!=="number")return A.P(s)
j=p*s
f.cx=0
s=B.a.P(j,4)
s=new Uint8Array(j+(4-s))
f.CW=s
f.ch=A.j6(s.buffer,0,h)}else{r.y=!1
r.x.cT()}}else r.r=1}i.dT=r}f=i.dT
f===$&&A.c("_alpha")
if(!f.w){s=i.cz
s===$&&A.c(g)
if(!f.i5(a,b,s))return h}f=i.cz
f===$&&A.c(g)
return A.l(f,!1,h,a*e)},
hb(a8,a9){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4=this,a5=a4.fr.b,a6=a4.dy,a7=a4.k1
a7===$&&A.c("_segment")
if(!(a7<4))return A.a(a6,a7)
s=a6[a7]
a7=a4.bj
a7===$&&A.c("_mbData")
a6=a4.y1
if(!(a6<a7.length))return A.a(a7,a6)
r=a7[a6]
q=A.l(r.a,!1,null,0)
a6=a4.k3
a6===$&&A.c("_mbInfo")
if(0>=a6.length)return A.a(a6,0)
p=a6[0]
q.iv(0,q.c-q.d,0)
a6=r.b
a6===$&&A.c("isIntra4x4")
if(!a6){o=A.l(new Int16Array(16),!1,null,0)
a6=a8.b
a7=p.b
if(1>=a5.length)return A.a(a5,1)
n=a4.cc(a9,a5[1],a6+a7,s.b,0,o)
a8.b=p.b=n>0?1:0
if(n>1)a4.hR(o,q)
else{a6=o.a
a7=o.d
if(!(a7>=0&&a7<a6.length))return A.a(a6,a7)
m=B.a.i(a6[a7]+3,3)
for(l=0;l<256;l+=16)J.m(q.a,q.d+l,m)}k=a5[0]
j=1}else{if(3>=a5.length)return A.a(a5,3)
k=a5[3]
j=0}i=a8.a&15
h=p.a&15
for(g=0,f=0;f<4;++f){e=h&1
for(d=0,c=0;c<4;++c,d=b){n=a4.cc(a9,k,e+(i&1),s.a,j,q)
e=n>j?1:0
i=i>>>1|e<<7
a6=q.a
a7=q.d
if(!(a7>=0&&a7<a6.length))return A.a(a6,a7)
a6=a6[a7]!==0?1:0
if(n>3)a6=3
else if(n>1)a6=2
b=d<<2|a6
q.d=a7+16}i=i>>>4
h=h>>>1|e<<7
g=(g<<8|d)>>>0}a=h>>>4
for(a6=a5.length,a0=i,a1=0,a2=0;a2<4;a2+=2){a7=4+a2
i=B.a.J(a8.a,a7)
h=B.a.J(p.a,a7)
for(d=0,f=0;f<2;++f){e=h&1
for(c=0;c<2;++c,d=b){if(2>=a6)return A.a(a5,2)
n=a4.cc(a9,a5[2],e+(i&1),s.c,0,q)
e=n>0?1:0
i=i>>>1|e<<3
a7=q.a
a3=q.d
if(!(a3>=0&&a3<a7.length))return A.a(a7,a3)
a7=a7[a3]!==0?1:0
if(n>3)a7=3
else if(n>1)a7=2
b=(d<<2|a7)>>>0
q.d=a3+16}i=i>>>2
h=h>>>1|e<<5}a1=(a1|B.a.A(d,4*a2))>>>0
a0=(a0|B.a.A(i<<4>>>0,a2))>>>0
a=(a|B.a.A(h&240,a2))>>>0}a8.a=a0
p.a=a
r.e=g
r.f=a1
if((a1&43690)===0)s.toString
return(g|a1)>>>0===0},
hR(a,a0){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b=new Int32Array(16)
for(s=a.a,r=a.d,q=s.length,p=0;p<4;++p){o=r+p
if(!(o>=0&&o<q))return A.a(s,o)
o=s[o]
n=12+p
m=r+n
if(!(m>=0&&m<q))return A.a(s,m)
m=s[m]
l=o+m
k=4+p
j=r+k
if(!(j>=0&&j<q))return A.a(s,j)
j=s[j]
i=8+p
h=r+i
if(!(h>=0&&h<q))return A.a(s,h)
h=s[h]
g=j+h
f=j-h
e=o-m
if(!(p<16))return A.a(b,p)
b[p]=l+g
if(!(i<16))return A.a(b,i)
b[i]=l-g
b[k]=e+f
if(!(n<16))return A.a(b,n)
b[n]=e-f}for(d=0,p=0;p<4;++p){s=p*4
if(!(s<16))return A.a(b,s)
c=b[s]+3
r=3+s
if(!(r<16))return A.a(b,r)
r=b[r]
l=c+r
q=1+s
if(!(q<16))return A.a(b,q)
q=b[q]
s=2+s
if(!(s<16))return A.a(b,s)
s=b[s]
g=q+s
f=q-s
e=c-r
r=B.a.i(l+g,3)
J.m(a0.a,a0.d+d,r)
r=B.a.i(e+f,3)
J.m(a0.a,a0.d+(d+16),r)
r=B.a.i(l-g,3)
J.m(a0.a,a0.d+(d+32),r)
r=B.a.i(e-f,3)
J.m(a0.a,a0.d+(d+48),r)
d+=64}},
fN(a,b){var s,r,q,p,o,n,m
t.L.a(b)
if(a.G(b[3])===0)s=a.G(b[4])===0?2:3+a.G(b[5])
else if(a.G(b[6])===0)s=a.G(b[7])===0?5+a.G(159):7+2*a.G(165)+a.G(145)
else{r=a.G(b[8])
q=9+r
if(!(q<11))return A.a(b,q)
p=2*r+a.G(b[q])
if(!(p<4))return A.a(B.ah,p)
o=B.ah[p]
for(n=o.length,s=0,m=0;m<n;++m)s+=s+a.G(o[m])
s+=3+B.a.A(8,p)}return s},
cc(a,b,c,d,e,f){var s,r,q,p,o,n,m,l,k,j
t.c7.a(b)
t.L.a(d)
s=b.length
if(!(e<s))return A.a(b,e)
r=b[e].a
if(!(c<r.length))return A.a(r,c)
q=r[c]
for(;e<16;e=p){if(a.G(q[0])===0)return e
for(;a.G(q[1])===0;){++e
if(!(e>=0&&e<17))return A.a(B.B,e)
r=B.B[e]
if(!(r<s))return A.a(b,r)
r=b[r].a
if(0>=r.length)return A.a(r,0)
q=r[0]
if(e===16)return 16}p=e+1
if(!(p>=0&&p<17))return A.a(B.B,p)
r=B.B[p]
if(!(r<s))return A.a(b,r)
o=b[r].a
r=o.length
if(a.G(q[2])===0){if(1>=r)return A.a(o,1)
q=o[1]
n=1}else{n=this.fN(a,q)
if(2>=r)return A.a(o,2)
q=o[2]}if(!(e>=0&&e<16))return A.a(B.a8,e)
r=B.a8[e]
m=a.b
m===$&&A.c("_range")
l=a.cX(B.a.i(m,1))
m=a.b
if(m>>>0!==m||m>=128)return A.a(B.A,m)
k=B.A[m]
a.b=B.aj[m]
m=a.d
m===$&&A.c("_bits")
a.d=m-k
m=l!==0?-n:n
j=d[e>0?1:0]
J.m(f.a,f.d+r,m*j)}return 16},
h7(){var s,r,q,p,o,n,m,l,k,j,i=this,h=i.y1,g=4*h,f=i.go,e=i.id,d=i.bj
d===$&&A.c("_mbData")
if(!(h<d.length))return A.a(d,h)
s=d[h]
h=i.c
h===$&&A.c("br")
h=h.G(145)===0
s.b=h
if(!h){if(i.c.G(156)!==0)r=i.c.G(128)!==0?1:3
else r=i.c.G(163)!==0?2:0
s.c[0]=r
f.toString
B.d.a6(f,g,g+4,r)
B.d.a6(e,0,4,r)}else{q=s.c
for(p=0,o=0;o<4;++o,p=j){r=e[o]
for(n=0;n<4;++n){h=g+n
if(!(h<f.length))return A.a(f,h)
d=f[h]
if(!(d<10))return A.a(B.a_,d)
d=B.a_[d]
if(!(r>=0&&r<10))return A.a(d,r)
m=d[r]
l=i.c.G(m[0])
if(!(l<18))return A.a(B.E,l)
k=B.E[l]
for(;k>0;){d=i.c
if(!(k<9))return A.a(m,k)
d=2*k+d.G(m[k])
if(!(d>=0&&d<18))return A.a(B.E,d)
k=B.E[d]}r=-k
f[h]=r}j=p+4
f.toString
B.d.W(q,p,j,f,g)
if(!(o<4))return A.a(e,o)
e[o]=r}}if(i.c.G(142)===0)h=0
else if(i.c.G(114)===0)h=2
else h=i.c.G(183)!==0?1:3
s.d=h},
seZ(a){this.k2=t.cC.a(a)},
seY(a){this.k3=t.eQ.a(a)},
seV(a){this.k4=t.ge.a(a)},
seX(a){this.bj=t.db.a(a)},
seW(a){this.cv=t.gS.a(a)}}
A.hv.prototype={
$2(a,b){return(a|b<<16)>>>0},
$S:35}
A.cL.prototype={
C(a){var s,r
for(s=0;r=a-1,a>0;a=r)s=(s|B.a.H(this.G(128),r))>>>0
return s},
b6(a){var s=this.C(a)
return this.C(1)===1?-s:s},
G(a){var s,r=this,q=r.b
q===$&&A.c("_range")
s=r.cX(B.a.i(q*a,8))
if(r.b<=126)r.hO()
return s},
cX(a){var s,r,q,p,o,n=this,m="_value",l=n.d
l===$&&A.c("_bits")
if(l<0){s=n.a
r=s.c
q=s.d
if(r-q>=1){p=s.q()
l=n.c
l===$&&A.c(m)
n.c=(p|l<<8)>>>0
l=n.d+8
n.d=l
o=l}else{if(q<r){l=s.q()
s=n.c
s===$&&A.c(m)
n.c=(l|s<<8)>>>0
s=n.d+8
n.d=s
l=s}else if(!n.e){s=n.c
s===$&&A.c(m)
n.c=s<<8>>>0
l+=8
n.d=l
n.e=!0}o=l}}else o=l
l=n.c
l===$&&A.c(m)
if(B.a.X(l,o)>a){s=n.b
s===$&&A.c("_range")
r=a+1
n.b=s-r
n.c=l-B.a.H(r,o)
return 1}else{n.b=a
return 0}},
hO(){var s,r=this,q=r.b
q===$&&A.c("_range")
if(!(q>=0&&q<128))return A.a(B.A,q)
s=B.A[q]
r.b=B.aj[q]
q=r.d
q===$&&A.c("_bits")
r.d=q-s}}
A.hj.prototype={
cL(a,b,c){var s,r=A.i(a,null,0)
for(s=0;s<16;++s){r.d=a.d+s
if(this.dn(r,b,c))this.bF(r,b)}},
cK(a,b,c){var s,r=A.i(a,null,0)
for(s=0;s<16;++s){r.d=a.d+s*b
if(this.dn(r,1,c))this.bF(r,1)}},
ek(a,b,c){var s,r,q=A.i(a,null,0)
for(s=4*b,r=3;r>0;--r){q.d+=s
this.cL(q,b,c)}},
ej(a,b,c){var s,r=A.i(a,null,0)
for(s=3;s>0;--s){r.d+=4
this.cK(r,b,c)}},
j1(a,b,c,d,e){var s,r,q=A.i(a,null,0)
for(s=4*b,r=3;r>0;--r){q.d+=s
this.aV(q,b,1,16,c,d,e)}},
il(a,b,c,d,e){var s,r=A.i(a,null,0)
for(s=3;s>0;--s){r.d+=4
this.aV(r,1,b,16,c,d,e)}},
aW(a1,a2,a3,a4,a5,a6,a7){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0=A.i(a1,null,0)
for(s=-3*a2,r=-2*a2,q=-a2,p=2*a2;o=a4-1,a4>0;a4=o){if(this.dq(a0,a2,a5,a6))if(this.dh(a0,a2,a7))this.bF(a0,a2)
else{n=a0.a
m=a0.d
l=m+s
k=n.length
if(!(l>=0&&l<k))return A.a(n,l)
j=n[l]
i=m+r
if(!(i>=0&&i<k))return A.a(n,i)
i=n[i]
h=m+q
if(!(h>=0&&h<k))return A.a(n,h)
h=n[h]
if(!(m>=0&&m<k))return A.a(n,m)
g=n[m]
f=m+a2
if(!(f<k))return A.a(n,f)
f=n[f]
m+=p
if(!(m<k))return A.a(n,m)
m=n[m]
k=$.iR()
e=1020+i-f
k.toString
if(!(e>=0&&e<2041))return A.a(k,e)
e=1020+3*(g-h)+k[e]
if(!(e>=0&&e<2041))return A.a(k,e)
d=k[e]
e=B.a.i(27*d+63,7)
c=(e&2147483647)-((e&2147483648)>>>0)
e=B.a.i(18*d+63,7)
b=(e&2147483647)-((e&2147483648)>>>0)
e=B.a.i(9*d+63,7)
a=(e&2147483647)-((e&2147483648)>>>0)
e=$.a6()
j=255+j+a
e.toString
if(!(j>=0&&j<766))return A.a(e,j)
J.m(n,l,e[j])
j=$.a6()
i=255+i+b
j.toString
if(!(i>=0&&i<766))return A.a(j,i)
i=j[i]
J.m(a0.a,a0.d+r,i)
i=$.a6()
h=255+h+c
i.toString
if(!(h>=0&&h<766))return A.a(i,h)
h=i[h]
J.m(a0.a,a0.d+q,h)
h=$.a6()
g=255+g-c
h.toString
if(!(g>=0&&g<766))return A.a(h,g)
g=h[g]
J.m(a0.a,a0.d,g)
g=$.a6()
f=255+f-b
g.toString
if(!(f>=0&&f<766))return A.a(g,f)
f=g[f]
J.m(a0.a,a0.d+a2,f)
f=$.a6()
m=255+m-a
f.toString
if(!(m>=0&&m<766))return A.a(f,m)
m=f[m]
J.m(a0.a,a0.d+p,m)}a0.d+=a3}},
aV(a,b,c,a0,a1,a2,a3){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d=A.i(a,null,0)
for(s=-2*b,r=-b;q=a0-1,a0>0;a0=q){if(this.dq(d,b,a1,a2))if(this.dh(d,b,a3))this.bF(d,b)
else{p=d.a
o=d.d
n=o+s
m=p.length
if(!(n>=0&&n<m))return A.a(p,n)
l=p[n]
k=o+r
if(!(k>=0&&k<m))return A.a(p,k)
k=p[k]
if(!(o>=0&&o<m))return A.a(p,o)
j=p[o]
o+=b
if(!(o<m))return A.a(p,o)
o=p[o]
i=3*(j-k)
m=$.eZ()
h=B.a.i(i+4,3)
h=112+((h&2147483647)-((h&2147483648)>>>0))
m.toString
if(!(h>=0&&h<225))return A.a(m,h)
g=m[h]
h=B.a.i(i+3,3)
h=112+((h&2147483647)-((h&2147483648)>>>0))
if(!(h>=0&&h<225))return A.a(m,h)
f=m[h]
h=B.a.i(g+1,1)
e=(h&2147483647)-((h&2147483648)>>>0)
h=$.a6()
l=255+l+e
h.toString
if(!(l>=0&&l<766))return A.a(h,l)
J.m(p,n,h[l])
l=$.a6()
k=255+k+f
l.toString
if(!(k>=0&&k<766))return A.a(l,k)
k=l[k]
J.m(d.a,d.d+r,k)
k=$.a6()
j=255+j-g
k.toString
if(!(j>=0&&j<766))return A.a(k,j)
j=k[j]
J.m(d.a,d.d,j)
j=$.a6()
o=255+o-e
j.toString
if(!(o>=0&&o<766))return A.a(j,o)
o=j[o]
J.m(d.a,d.d+b,o)}d.d+=c}},
bF(a,b){var s,r,q,p,o,n,m=a.a,l=a.d,k=l+-2*b,j=m.length
if(!(k>=0&&k<j))return A.a(m,k)
k=m[k]
s=-b
r=l+s
if(!(r>=0&&r<j))return A.a(m,r)
r=m[r]
if(!(l>=0&&l<j))return A.a(m,l)
q=m[l]
l+=b
if(!(l<j))return A.a(m,l)
l=m[l]
m=$.iR()
l=1020+k-l
m.toString
if(!(l>=0&&l<2041))return A.a(m,l)
p=3*(q-r)+m[l]
l=$.eZ()
m=112+B.a.R(B.a.i(p+4,3),32)
l.toString
if(!(m>=0&&m<225))return A.a(l,m)
o=l[m]
m=$.eZ()
l=112+B.a.R(B.a.i(p+3,3),32)
m.toString
if(!(l>=0&&l<225))return A.a(m,l)
n=m[l]
l=$.a6()
r=255+r+n
l.toString
if(!(r>=0&&r<766))return A.a(l,r)
a.h(0,s,l[r])
r=$.a6()
q=255+q-o
r.toString
if(!(q>=0&&q<766))return A.a(r,q)
a.h(0,0,r[q])},
dh(a,b,c){var s,r,q=a.a,p=a.d,o=p+-2*b,n=q.length
if(!(o>=0&&o<n))return A.a(q,o)
o=q[o]
s=p+-b
if(!(s>=0&&s<n))return A.a(q,s)
s=q[s]
if(!(p>=0&&p<n))return A.a(q,p)
r=q[p]
p+=b
if(!(p<n))return A.a(q,p)
p=q[p]
q=$.eY()
s=255+o-s
q.toString
if(!(s>=0&&s<511))return A.a(q,s)
if(q[s]<=c){p=255+p-r
if(!(p>=0&&p<511))return A.a(q,p)
p=q[p]>c
q=p}else q=!0
return q},
dn(a,b,c){var s,r,q=a.a,p=a.d,o=p+-2*b,n=q.length
if(!(o>=0&&o<n))return A.a(q,o)
o=q[o]
s=p+-b
if(!(s>=0&&s<n))return A.a(q,s)
s=q[s]
if(!(p>=0&&p<n))return A.a(q,p)
r=q[p]
p+=b
if(!(p<n))return A.a(q,p)
p=q[p]
q=$.eY()
r=255+s-r
q.toString
if(!(r>=0&&r<511))return A.a(q,r)
r=q[r]
q=$.iQ()
p=255+o-p
q.toString
if(!(p>=0&&p<511))return A.a(q,p)
return 2*r+q[p]<=c},
dq(a,b,c,d){var s,r,q,p,o,n,m,l,k,j=a.a,i=a.d,h=i+-4*b,g=j.length
if(!(h>=0&&h<g))return A.a(j,h)
h=j[h]
s=i+-3*b
if(!(s>=0&&s<g))return A.a(j,s)
s=j[s]
r=i+-2*b
if(!(r>=0&&r<g))return A.a(j,r)
r=j[r]
q=i+-b
if(!(q>=0&&q<g))return A.a(j,q)
q=j[q]
if(!(i>=0&&i<g))return A.a(j,i)
p=j[i]
o=i+b
if(!(o<g))return A.a(j,o)
o=j[o]
n=i+2*b
if(!(n<g))return A.a(j,n)
n=j[n]
i+=3*b
if(!(i<g))return A.a(j,i)
i=j[i]
j=$.eY()
g=255+q-p
j.toString
if(!(g>=0&&g<511))return A.a(j,g)
g=j[g]
m=$.iQ()
l=255+r
k=l-o
m.toString
if(!(k>=0&&k<511))return A.a(m,k)
if(2*g+m[k]>c)return!1
h=255+h-s
if(!(h>=0&&h<511))return A.a(j,h)
if(j[h]<=d){h=255+s-r
if(!(h>=0&&h<511))return A.a(j,h)
if(j[h]<=d){h=l-q
if(!(h>=0&&h<511))return A.a(j,h)
if(j[h]<=d){i=255+i-n
if(!(i>=0&&i<511))return A.a(j,i)
if(j[i]<=d){i=255+n-o
if(!(i>=0&&i<511))return A.a(j,i)
if(j[i]<=d){i=255+o-p
if(!(i>=0&&i<511))return A.a(j,i)
i=j[i]<=d
j=i}else j=!1}else j=!1}else j=!1}else j=!1}else j=!1
return j},
al(a,a0){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b=new Int32Array(16)
for(s=a.a,r=a.d,q=s.length,p=0,o=0,n=0;n<4;++n){m=r+p
if(!(m>=0&&m<q))return A.a(s,m)
m=s[m]
l=r+(p+8)
if(!(l>=0&&l<q))return A.a(s,l)
l=s[l]
k=m+l
j=m-l
l=r+(p+4)
if(!(l>=0&&l<q))return A.a(s,l)
l=s[l]
m=B.a.i(l*35468,16)
i=r+(p+12)
if(!(i>=0&&i<q))return A.a(s,i)
i=s[i]
h=B.a.i(i*85627,16)
g=(m&2147483647)-((m&2147483648)>>>0)-((h&2147483647)-((h&2147483648)>>>0))
l=B.a.i(l*85627,16)
i=B.a.i(i*35468,16)
f=(l&2147483647)-((l&2147483648)>>>0)+((i&2147483647)-((i&2147483648)>>>0))
e=o+1
if(!(o<16))return A.a(b,o)
b[o]=k+f
o=e+1
if(!(e<16))return A.a(b,e)
b[e]=j+g
e=o+1
if(!(o<16))return A.a(b,o)
b[o]=j-g
o=e+1
if(!(e<16))return A.a(b,e)
b[e]=k-f;++p}for(d=0,o=0,n=0;n<4;++n){if(!(o<16))return A.a(b,o)
c=b[o]+4
s=o+8
if(!(s<16))return A.a(b,s)
s=b[s]
k=c+s
j=c-s
s=o+4
if(!(s<16))return A.a(b,s)
s=b[s]
r=B.a.i(s*35468,16)
q=o+12
if(!(q<16))return A.a(b,q)
q=b[q]
m=B.a.i(q*85627,16)
g=(r&2147483647)-((r&2147483648)>>>0)-((m&2147483647)-((m&2147483648)>>>0))
s=B.a.i(s*85627,16)
q=B.a.i(q*35468,16)
f=(s&2147483647)-((s&2147483648)>>>0)+((q&2147483647)-((q&2147483648)>>>0))
A.b3(a0,d,0,0,k+f)
A.b3(a0,d,1,0,j+g)
A.b3(a0,d,2,0,j-g)
A.b3(a0,d,3,0,k-f);++o
d+=32}},
iY(a,b,c){this.al(a,b)
if(c)this.al(A.i(a,null,16),A.i(b,null,4))},
bt(a,b){var s,r,q,p=a.a,o=a.d
if(!(o>=0&&o<p.length))return A.a(p,o)
s=p[o]+4
for(r=0;r<4;++r)for(q=0;q<4;++q)A.b3(b,0,q,r,s)},
e9(a,b){var s=this,r=null,q=a.a,p=a.d
if(!(p>=0&&p<q.length))return A.a(q,p)
if(q[p]!==0)s.bt(a,b)
q=a.a
p=a.d+16
if(!(p>=0&&p<q.length))return A.a(q,p)
if(q[p]!==0)s.bt(A.i(a,r,16),A.i(b,r,4))
q=a.a
p=a.d+32
if(!(p>=0&&p<q.length))return A.a(q,p)
if(q[p]!==0)s.bt(A.i(a,r,32),A.i(b,r,128))
q=a.a
p=a.d+48
if(!(p>=0&&p<q.length))return A.a(q,p)
if(q[p]!==0)s.bt(A.i(a,r,48),A.i(b,r,132))}}
A.ho.prototype={}
A.hs.prototype={}
A.hu.prototype={}
A.cK.prototype={}
A.ht.prototype={}
A.hk.prototype={}
A.aK.prototype={}
A.cN.prototype={}
A.eG.prototype={}
A.cO.prototype={}
A.cP.prototype={}
A.cM.prototype={
bi(){var s,r=this.b
if(r.K(8)!==47)return!1
s=this.c
s.f=2
s.a=r.K(14)+1
s.b=r.K(14)+1
s.d=r.K(1)!==0
if(r.K(3)!==0)return!1
return!0},
ap(){var s,r,q,p=this
p.e=0
if(!p.bi())return null
s=p.c
p.ba(s.a,s.b,!0)
p.cT()
p.d=A.ak(s.a,s.b,B.i)
r=p.ch
r.toString
q=s.a
s=s.b
if(!p.c6(r,q,s,s,p.ghh()))return null
return p.d},
cT(){var s,r=this,q=r.c,p=q.a
q=q.b
if(typeof p!=="number")return p.af()
if(typeof q!=="number")return A.P(q)
q=p*q+p
s=new Uint32Array(q+p*16)
r.ch=s
r.CW=A.N(s.buffer,0,null)
r.cx=q
return!0},
hI(a){var s,r,q,p,o,n,m,l=this
t.L.a(a)
s=l.b
r=s.K(2)
q=l.ay
p=B.a.A(1,r)
if((q&p)>>>0!==0)return!1
l.ay=(q|p)>>>0
o=new A.eF()
B.b.v(l.ax,o)
o.a=r
o.b=a[0]
o.c=a[1]
switch(r){case 0:case 1:s=o.e=s.K(3)+2
o.d=l.ba(A.bv(o.b,s),A.bv(o.c,s),!1)
break
case 3:n=s.K(8)+1
if(n>16)m=0
else if(n>4)m=1
else{s=n>2?2:3
m=s}B.b.h(a,0,A.bv(o.b,m))
o.e=m
o.d=l.ba(n,1,!1)
l.fG(n,o)
break
case 2:break
default:throw A.d(A.f("Invalid WebP transform type: "+r))}return!0},
ba(a,b,c){var s,r,q,p,o,n,m,l,k=this
A.n(a)
A.n(b)
if(c){for(s=k.b,r=t.t,q=b,p=a;s.K(1)!==0;){o=A.b([p,q],r)
if(!k.hI(o))throw A.d(A.f("Invalid Transform"))
p=o[0]
q=o[1]}c=!0}else{q=b
p=a}s=k.b
if(s.K(1)!==0){n=s.K(4)
if(!(n>=1&&n<=11))throw A.d(A.f("Invalid Color Cache"))}else n=0
if(!k.hx(p,q,n,c))throw A.d(A.f("Invalid Huffman Codes"))
if(n>0){s=B.a.A(1,n)
k.r=s
k.w=new A.hp(new Uint32Array(s),32-n)}else k.r=0
s=k.c
s.a=p
s.b=q
m=k.y
k.z=A.bv(p,m)
k.x=m===0?4294967295:B.a.A(1,m)-1
if(c){k.e=0
return null}l=new Uint32Array(p*q)
if(!k.c6(l,p,q,q,null))throw A.d(A.f("Failed to decode image data."))
k.e=0
return l},
c6(b0,b1,b2,b3,b4){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9=this
A.n(b1)
A.n(b2)
A.n(b3)
t.bJ.a(b4)
s=a9.e
r=B.a.O(s,b1)
q=B.a.P(s,b1)
p=a9.da(q,r)
o=a9.e
n=b1*b2
m=b1*b3
s=a9.r
l=280+s
k=s>0?a9.w:null
j=a9.x
s=b0.length
i=a9.b
h=b4!=null
g=o
while(!0){f=i.b
e=f.c
if(!(!(f.d>=e&&i.a>=64)&&o<m))break
if((q&j)>>>0===0){d=a9.bb(a9.Q,a9.z,a9.y,q,r)
f=a9.at
if(!(d<f.length))return A.a(f,d)
p=f[d]}if(i.a>=32)i.aN()
f=p.a
e=f.length
if(0>=e)return A.a(f,0)
c=f[0].aG(i)
if(c<256){if(1>=e)return A.a(f,1)
b=f[1].aG(i)
if(i.a>=32)i.aN()
if(2>=e)return A.a(f,2)
a=f[2].aG(i)
if(3>=e)return A.a(f,3)
f=B.c.n(B.a.p(f[3].aG(i),0,255))
e=B.c.n(B.a.p(b,0,255))
a0=B.c.n(B.a.p(c,0,255))
a1=B.c.n(B.a.p(a,0,255))
if(!(o>=0&&o<s))return A.a(b0,o)
b0[o]=(f<<24|e<<16|a0<<8|a1)>>>0;++o;++q
if(q>=b1){++r
if(B.a.P(r,16)===0&&h)b4.$1(r)
if(k!=null)for(f=k.b,e=k.a,a0=e.length;g<o;){if(!(g>=0))return A.a(b0,g)
a1=b0[g]
a2=B.a.Z(a1*506832829>>>0,f)
if(!(a2<a0))return A.a(e,a2)
e[a2]=a1;++g}q=0}}else if(c<280){a3=a9.bH(c-256)
if(4>=e)return A.a(f,4)
a4=f[4].aG(i)
if(i.a>=32)i.aN()
a5=a9.dv(b1,a9.bH(a4))
if(o<a5||n-o<a3)return!1
else{a6=o-a5
for(a7=0;a7<a3;++a7){f=o+a7
e=a6+a7
if(!(e>=0&&e<s))return A.a(b0,e)
e=b0[e]
if(!(f>=0&&f<s))return A.a(b0,f)
b0[f]=e}o+=a3}q+=a3
for(;q>=b1;){q-=b1;++r
if(B.a.P(r,16)===0&&h)b4.$1(r)}if(o<m){if((q&j)>>>0!==0){d=a9.bb(a9.Q,a9.z,a9.y,q,r)
f=a9.at
if(!(d<f.length))return A.a(f,d)
p=f[d]}if(k!=null)for(f=k.b,e=k.a,a0=e.length;g<o;){if(!(g>=0&&g<s))return A.a(b0,g)
a1=b0[g]
a2=B.a.Z(a1*506832829>>>0,f)
if(!(a2<a0))return A.a(e,a2)
e[a2]=a1;++g}}}else if(c<l){a2=c-280
for(;g<o;){k.toString
if(!(g>=0&&g<s))return A.a(b0,g)
f=b0[g]
a8=B.a.Z(f*506832829>>>0,k.b)
e=k.a
if(!(a8<e.length))return A.a(e,a8)
e[a8]=f;++g}f=k.a
e=f.length
if(!(a2<e))return A.a(f,a2)
a0=f[a2]
if(!(o>=0&&o<s))return A.a(b0,o)
b0[o]=a0;++o;++q
if(q>=b1){++r
if(B.a.P(r,16)===0&&h)b4.$1(r)
for(a0=k.b;g<o;){if(!(g>=0))return A.a(b0,g)
a1=b0[g]
a2=B.a.Z(a1*506832829>>>0,a0)
if(!(a2<e))return A.a(f,a2)
f[a2]=a1;++g}q=0}}else return!1}if(h)b4.$1(r)
if(f.d>=e&&i.a>=64&&o<n)return!1
a9.e=o
return!0},
fU(){var s,r,q,p,o,n
if(this.r>0)return!1
for(s=this.as,r=this.at,q=r.length,p=0;p<s;++p){if(!(p<q))return A.a(r,p)
o=r[p].a
n=o.length
if(1>=n)return A.a(o,1)
if(o[1].f>1)return!1
if(2>=n)return A.a(o,2)
if(o[2].f>1)return!1
if(3>=n)return A.a(o,3)
if(o[3].f>1)return!1}return!0},
fH(a){var s,r,q,p,o,n,m,l,k,j,i=this,h=i.f,g=a-h
if(g<=0)return
s=i.c
r=s.a
if(typeof r!=="number")return r.af()
i.cU(g,r*h)
q=s.a
p=q*g
o=q*i.f
s=i.ch
s.toString
h=i.cx
h.toString
n=A.l(s,!1,null,h)
for(h=i.cy,s=n.a,r=n.d,m=s.length,l=0;l<p;++l){h.toString
k=o+l
j=r+l
if(!(j>=0&&j<m))return A.a(s,j)
j=B.a.i(s[j],8)
if(!(k>=0&&k<h.length))return A.a(h,k)
h[k]=j&255}i.f=a},
fh(a1,a2,a3){var s,r,q,p,o,n,m,l,k,j,i=this,h="_pixels8",g=i.e,f=B.a.O(g,a1),e=B.a.P(g,a1),d=i.da(e,f),c=i.e,b=a1*a2,a=a1*a3,a0=i.x
g=i.b
while(!0){s=g.b
if(!(!(s.d>=s.c&&g.a>=64)&&c<a))break
if((e&a0)>>>0===0){r=i.bb(i.Q,i.z,i.y,e,f)
s=i.at
if(!(r<s.length))return A.a(s,r)
d=s[r]}if(g.a>=32)g.aN()
s=d.a
q=s.length
if(0>=q)return A.a(s,0)
p=s[0].aG(g)
if(p<256){s=i.CW
s===$&&A.c(h)
if(!(c>=0&&c<s.length))return A.a(s,c)
s[c]=p;++c;++e
if(e>=a1){++f
if(B.a.P(f,16)===0)i.ca(f)
e=0}}else if(p<280){o=i.bH(p-256)
if(4>=q)return A.a(s,4)
n=s[4].aG(g)
if(g.a>=32)g.aN()
m=i.dv(a1,i.bH(n))
if(c>=m&&b-c>=o)for(s=i.CW,l=0;l<o;++l){s===$&&A.c(h)
q=c+l
k=q-m
j=s.length
if(!(k>=0&&k<j))return A.a(s,k)
k=s[k]
if(!(q>=0&&q<j))return A.a(s,q)
s[q]=k}else{i.e=c
return!0}c+=o
e+=o
for(;e>=a1;){e-=a1;++f
if(B.a.P(f,16)===0)i.ca(f)}if(c<a&&(e&a0)>>>0!==0){r=i.bb(i.Q,i.z,i.y,e,f)
s=i.at
if(!(r<s.length))return A.a(s,r)
d=s[r]}}else return!1}i.ca(f)
i.e=c
return!0},
ca(a){var s,r,q,p=this,o=p.f,n=a-o,m=p.CW
m===$&&A.c("_pixels8")
s=p.c.a
if(typeof s!=="number")return s.af()
r=A.l(m,!1,null,s*o)
if(n>0){m=p.cy
m.toString
s=p.db
s.toString
q=A.l(m,!1,null,s*o)
s=p.ax
if(0>=s.length)return A.a(s,0)
s[0].hX(o,o+n,r,q)}p.f=a},
hi(a){var s,r,q,p,o,n,m,l,k,j,i=this,h=i.c,g=h.a,f=i.f
if(typeof g!=="number")return g.af()
s=a-f
if(s<=0)return
i.cU(s,g*f)
g=i.cx
g.toString
r=i.f
q=g
p=0
for(;p<s;++p,++r){o=0
while(!0){g=h.a
if(typeof g!=="number")return A.P(g)
if(!(o<g))break
g=i.ch
if(!(q>=0&&q<g.length))return A.a(g,q)
n=g[q]
g=i.d
g.toString
f=B.c.n(B.a.p(n>>>24&255,0,255))
m=B.c.n(B.a.p(n&255,0,255))
l=B.c.n(B.a.p(n>>>8&255,0,255))
k=B.c.n(B.a.p(n>>>16&255,0,255))
j=g.x
g=r*g.a+o
if(!(g>=0&&g<j.length))return A.a(j,g)
j[g]=(f<<24|m<<16|l<<8|k)>>>0;++o;++q}}i.f=a},
cU(a,b){var s,r,q,p,o,n,m,l,k,j,i,h,g,f=this,e=f.ax,d=e.length,c=f.c.a
if(typeof c!=="number")return c.af()
s=f.f
r=s+a
q=f.cx
q.toString
p=f.ch
p.toString
B.q.W(p,q,q+c*a,p,b)
for(c=r-s,p=c-1,o=b;n=d-1,d>0;o=q,d=n){if(!(n>=0&&n<e.length))return A.a(e,n)
m=e[n]
l=f.ch
l.toString
k=m.b
switch(m.a){case 2:m.hS(l,q,q+c*k)
break
case 0:m.iB(s,r,l,q)
if(r!==m.c){j=q-k
B.q.W(l,j,j+k,l,q+p*k)}break
case 1:m.i0(s,r,l,q)
break
case 3:if(o===q&&m.e>0){i=m.e
h=c*B.a.i(k+B.a.A(1,i)-1,i)
g=q+c*k-h
B.q.W(l,g,g+h,l,q)
m.dO(s,r,l,g,l,q)}else m.dO(s,r,l,o,l,q)
break}}},
hx(a,b,c,d){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e=this
if(d&&e.b.K(1)!==0){s=e.b.K(3)+2
r=A.bv(a,s)
q=A.bv(b,s)
p=r*q
o=e.ba(r,q,!1)
e.y=s
for(n=1,m=0;m<p;++m){if(!(m<o.length))return A.a(o,m)
l=o[m]>>>8&65535
o[m]=l
if(l>=n)n=l+1}}else{o=null
n=1}k=J.a9(n,t.ct)
for(j=0;j<n;++j)k[j]=A.ml()
for(i=c>0,m=0;m<n;++m)for(h=0;h<5;++h){g=B.es[h]
if(h===0&&i)g+=B.a.A(1,c)
if(!(m<n))return A.a(k,m)
f=k[m].a
if(!(h<f.length))return A.a(f,h)
if(!e.hv(g,f[h]))return!1}e.Q=o
e.as=n
e.sfQ(k)
return!0},
hv(a,b){var s,r,q,p,o,n,m,l,k,j,i=this.b
if(i.K(1)!==0){s=t.t
r=A.b([0,0],s)
q=A.b([0,0],s)
p=A.b([0,0],s)
o=i.K(1)+1
B.b.h(r,0,i.K(i.K(1)===0?1:8))
B.b.h(q,0,0)
s=o-1
B.b.h(p,0,s)
if(o===2){B.b.h(r,1,i.K(8))
B.b.h(q,1,1)
B.b.h(p,1,s)}n=b.hW(p,q,r,a,o)}else{m=new Int32Array(19)
l=i.K(4)+4
if(l>19)return!1
p=new Int32Array(a)
for(k=0;k<l;++k){s=B.e0[k]
j=i.K(3)
if(!(s<19))return A.a(m,s)
m[s]=j}n=this.hw(m,a,p)
if(n)n=b.dN(p,a)}return n},
hw(a,b,c){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e=t.L
e.a(a)
e.a(c)
s=A.k5()
if(!s.dN(a,19))return!1
e=this.b
if(e.K(1)!==0){r=2+e.K(2+2*e.K(3))
if(r>b)return!1}else r=b
for(q=c.length,p=0,o=8;p<b;r=n){n=r-1
if(r===0)break
if(e.a>=32)e.aN()
m=s.aG(e)
if(m<16){l=p+1
if(!(p>=0&&p<q))return A.a(c,p)
c[p]=m
if(m!==0)o=m
p=l}else{k=m-16
if(!(k<3))return A.a(B.X,k)
j=B.X[k]
i=B.b5[k]
h=e.K(j)+i
if(p+h>b)return!1
else{g=m===16?o:0
for(;f=h-1,h>0;h=f,p=l){l=p+1
if(!(p>=0&&p<q))return A.a(c,p)
c[p]=g}}}}return!0},
bH(a){var s
if(a<4)return a+1
s=B.a.i(a-2,1)
return B.a.A(2+(a&1),s)+this.b.K(s)+1},
dv(a,b){var s,r,q
if(b>120)return b-120
else{s=b-1
if(!(s>=0))return A.a(B.a1,s)
r=B.a1[s]
q=(r>>>4)*a+(8-(r&15))
return q>=1?q:1}},
fG(a,b){var s,r,q,p,o,n=B.a.A(1,B.a.J(8,b.e)),m=new Uint32Array(n),l=A.N(b.d.buffer,0,null),k=A.N(m.buffer,0,null),j=b.d
if(0>=j.length)return A.a(j,0)
j=j[0]
if(0>=n)return A.a(m,0)
m[0]=j
s=4*a
for(j=l.length,r=k.length,q=4;q<s;++q){if(!(q<j))return A.a(l,q)
p=l[q]
o=q-4
if(!(o<r))return A.a(k,o)
o=k[o]
if(!(q<r))return A.a(k,q)
k[q]=p+o&255}for(s=4*n;q<s;++q){if(!(q<r))return A.a(k,q)
k[q]=0}b.d=m
return!0},
bb(a,b,c,d,e){var s
if(c===0)return 0
a.toString
s=b*B.a.i(e,c)+B.a.i(d,c)
if(!(s<a.length))return A.a(a,s)
return a[s]},
da(a,b){var s=this,r=s.bb(s.Q,s.z,s.y,a,b),q=s.at
if(!(r<q.length))return A.a(q,r)
return q[r]},
sfQ(a){this.at=t.d1.a(a)}}
A.dR.prototype={
ii(a){return this.fH(a)}}
A.eE.prototype={
e1(){var s,r,q,p=this.a
if(p<32){s=this.c
r=B.a.Z(s[0],p)
s=s[1]
if(!(p>=0))return A.a(B.t,p)
q=r+((s&B.t[p])>>>0)*(B.t[32-p]+1)}else{s=this.c
q=p===32?s[1]:B.a.Z(s[1],p-32)}return q},
K(a){var s,r=this,q=r.b
if(!(q.d>=q.c&&r.a>=64)&&a<25){q=r.e1()
if(!(a<33))return A.a(B.t,a)
s=B.t[a]
r.a+=a
r.aN()
return(q&s)>>>0}else throw A.d(A.f("Not enough data in input."))},
aN(){var s,r,q,p,o=this,n=o.b,m=o.c,l=n.c
while(!0){s=o.a
if(!(s>=8&&n.d<l))break
r=n.a
q=n.d++
if(!(q>=0&&q<r.length))return A.a(r,q)
q=r[q]
r=m[0]
p=m[1]
m[0]=(r>>>8)+(p&255)*16777216
m[1]=p>>>8
m[1]=(m[1]|q*16777216)>>>0
o.a=s-8}}}
A.hp.prototype={}
A.eF.prototype={
hX(a,b,c,d){var s,r,q,p,o,n,m=this.e,l=B.a.J(8,m),k=this.b,j=this.d
if(l<8){s=B.a.A(1,m)-1
r=B.a.A(1,l)-1
for(q=a;q<b;++q)for(p=0,o=0;o<k;++o){if((o&s)>>>0===0){m=c.a
n=c.d
if(!(n>=0&&n<m.length))return A.a(m,n)
p=m[n]
c.d=n+1}m=(p&r)>>>0
if(!(m>=0&&m<j.length))return A.a(j,m)
m=j[m]
J.m(d.a,d.d,m>>>8&255);++d.d
p=B.a.i(p,l)}}else for(q=a;q<b;++q)for(o=0;o<k;++o){m=c.a
n=c.d
if(!(n>=0&&n<m.length))return A.a(m,n)
m=m[n]
c.d=n+1
if(m>>>0!==m||m>=j.length)return A.a(j,m)
m=j[m]
J.m(d.a,d.d,m>>>8&255);++d.d}},
dO(a,b,c,d,e,f){var s,r,q,p,o,n,m,l,k,j=this.e,i=B.a.J(8,j),h=this.b,g=this.d
if(i<8){s=B.a.A(1,j)-1
r=B.a.A(1,i)-1
for(j=e.length,q=c.length,p=a;p<b;++p)for(o=0,n=0;n<h;++n,f=l){if((n&s)>>>0===0){m=d+1
if(!(d>=0&&d<q))return A.a(c,d)
o=c[d]>>>8&255
d=m}l=f+1
k=o&r
if(!(k>=0&&k<g.length))return A.a(g,k)
k=g[k]
if(!(f>=0&&f<j))return A.a(e,f)
e[f]=k
o=B.a.J(o,i)}}else for(j=c.length,q=e.length,p=a;p<b;++p)for(n=0;n<h;++n,f=l,d=m){l=f+1
g.toString
m=d+1
if(!(d>=0&&d<j))return A.a(c,d)
k=c[d]>>>8&255
if(!(k<g.length))return A.a(g,k)
k=g[k]
if(!(f>=0&&f<q))return A.a(e,f)
e[f]=k}},
i0(a5,a6,a7,a8){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0=this.b,a1=this.e,a2=B.a.A(1,a1)-1,a3=A.bv(a0,a1),a4=B.a.i(a5,a1)*a3
for(a1=a7.length,s=a5;s<a6;){r=new Uint8Array(3)
for(q=a4,p=0;p<a0;++p){if((p&a2)>>>0===0){o=this.d
n=q+1
if(!(q<o.length))return A.a(o,q)
o=o[q]
r[0]=o&255
r[1]=o>>>8&255
r[2]=o>>>16&255
q=n}o=a8+p
if(!(o>=0&&o<a1))return A.a(a7,o)
m=a7[o]
l=m>>>8&255
k=r[0]
j=$.W()
j[0]=k
k=$.a3()
i=k.length
if(0>=i)return A.a(k,0)
h=k[0]
j[0]=l
if(0>=i)return A.a(k,0)
g=k[0]
f=$.jM()
f[0]=h*g
e=$.lK()
d=e.length
if(0>=d)return A.a(e,0)
c=(m>>>16&255)+(e[0]>>>5)>>>0&255
j[0]=r[1]
if(0>=i)return A.a(k,0)
h=k[0]
j[0]=l
if(0>=i)return A.a(k,0)
f[0]=h*k[0]
if(0>=d)return A.a(e,0)
b=e[0]
j[0]=r[2]
if(0>=i)return A.a(k,0)
h=k[0]
j[0]=c
if(0>=i)return A.a(k,0)
f[0]=h*k[0]
if(0>=d)return A.a(e,0)
a=e[0]
a7[o]=(m&4278255360|c<<16|((m&255)+(b>>>5)>>>0)+(a>>>5)>>>0&255)>>>0}a8+=a0;++s
if((s&a2)>>>0===0)a4+=a3}},
iB(a,b,c,d){var s,r,q,p,o,n,m,l,k,j,i,h=this,g=h.b
if(a===0){s=d-1
r=c.length
if(!(s>=0&&s<r))return A.a(c,s)
A.hq(c,d,4278190080)
for(q=1;q<g;++q){s=d+q
p=s-1
if(!(p>=0&&p<r))return A.a(c,p)
A.hq(c,s,c[p])}d+=g;++a}s=h.e
o=B.a.A(1,s)-1
n=A.bv(g,s)
m=B.a.i(a,s)*n
for(s=c.length,l=a;l<b;){r=d-1
if(!(r>=0&&r<s))return A.a(c,r)
r=d-g
if(!(r>=0&&r<s))return A.a(c,r)
A.hq(c,d,c[r])
r=h.d
k=m+1
if(!(m<r.length))return A.a(r,m)
j=$.kN[r[m]>>>8&15]
for(q=1;q<g;++q){if((q&o)>>>0===0){r=h.d
i=k+1
if(!(k<r.length))return A.a(r,k)
j=$.kN[r[k]>>>8&15]
k=i}r=d+q
p=r-1
if(!(p>=0&&p<s))return A.a(c,p)
A.hq(c,r,j.$3(c,c[p],r-g))}d+=g;++l
if((l&o)>>>0===0)m+=n}},
hS(a,b,c){var s,r,q,p
for(s=a.length;b<c;b=p){if(!(b>=0&&b<s))return A.a(a,b)
r=a[b]
q=r>>>8&255
p=b+1
a[b]=(r&4278255360|(r&16711935)+(q<<16|q)&16711935)>>>0}}}
A.hw.prototype={
gdZ(){var s=this,r=s.d
if(r>1||s.e>=4||s.f>1||s.r!==0)return!1
return!0},
i5(a,b,c){var s,r,q,p,o,n,m,l=this
if(!l.gdZ())return!1
s=l.e
if(!(s<4))return A.a(B.a2,s)
r=B.a2[s]
if(l.d===0){s=l.b
q=a*s
p=l.a
B.d.W(c,q,b*s,p.a,p.d-p.b+q)}else{s=a+b
p=l.x
p===$&&A.c("_vp8l")
p.cy=c
o=p.c
if(l.y){n=o.a
o=o.b
s=p.fh(A.n(n),A.n(o),s)}else{n=p.ch
n.toString
m=o.a
o=o.b
p=p.c6(n,A.n(m),A.n(o),s,t.aR.a(p.gih()))
s=p}if(!s)return!1}if(r!=null){s=l.b
r.$6(s,l.c,s,a,b,c)}if(l.f===1)if(!l.fz(c,l.b,l.c,a,b))return!1
if(a+b===l.c)l.w=!0
return!0},
fz(a,b,c,d,e){if(b<=0||c<=0||d<0||e<0||d+e>c)return!1
return!0}}
A.cQ.prototype={
eL(a,b){a.q()
this.r=0
this.w=a.d-a.b
this.x=b-16}}
A.dS.prototype={}
A.dC.prototype={
cg(a){var s,r,q=this
if(a===0)return!1
s=(a<<1>>>0)-1
q.e=s
s=s<<1>>>0
r=q.d=new Int32Array(s)
if(1>=s)return A.a(r,1)
r[1]=-1
q.f=1
B.d.a6(q.a,0,128,255)
return!0},
dN(a,b){var s,r,q,p,o,n,m=this
t.L.a(a)
for(s=a.length,r=0,q=0,p=0;p<b;++p){if(!(p<s))return A.a(a,p)
if(a[p]>0){++r
q=p}}if(!m.cg(r))return!1
if(r===1){if(q<0||q>=b)return!1
return m.bZ(q,0,0)}o=new Int32Array(b)
if(!m.fR(a,b,o))return!1
for(p=0;p<b;++p){if(!(p<s))return A.a(a,p)
n=a[p]
if(n>0)if(!m.bZ(p,o[p],n))return!1}return m.f===m.e},
hW(a,b,c,d,e){var s,r,q=this,p=t.L
p.a(a)
p.a(b)
p.a(c)
if(!q.cg(e))return!1
for(s=0;s<e;++s){if(!(s<2))return A.a(b,s)
p=b[s]
if(p!==-1){r=c[s]
if(r>=d)return q.f===q.e
if(!q.bZ(r,p,a[s]))return q.f===q.e}}return q.f===q.e},
aG(a){var s,r,q,p=this,o=a.e1(),n=a.a,m=o&127,l=p.a[m]
if(l<=7){a.a=n+l
return p.b[m]}s=p.c[m]
n+=7
o=o>>>7
do{r=p.d
r===$&&A.c("tree")
q=(s<<1>>>0)+1
if(!(q<r.length))return A.a(r,q)
s=s+r[q]+(o&1)
o=o>>>1;++n}while(p.ds(s))
a.a=n
r=p.d
q=s<<1>>>0
if(!(q<r.length))return A.a(r,q)
return r[q]},
bZ(a,b,c){var s,r,q,p,o,n,m,l,k,j,i,h,g=this
if(c<=7){s=g.dD(b,c)
for(r=B.a.H(1,7-c),q=g.b,p=g.a,o=0;o<r;++o){n=(s|B.a.H(o,c))>>>0
if(!(n<128))return A.a(q,n)
q[n]=a
p[n]=c}}else s=g.dD(B.a.X(b,c-7),7)
for(r=g.c,m=7,l=0;k=c-1,c>0;c=k){q=g.e
if(l>=q)return!1
p=g.d
p===$&&A.c("tree")
j=(l<<1>>>0)+1
i=p.length
if(!(j<i))return A.a(p,j)
h=p[j]
if(h<0){h=g.f
if(h===q)return!1
p[j]=h-l
g.f=h+2
q=(h<<1>>>0)+1
if(!(q<i))return A.a(p,q)
p[q]=-1
h=(h+1<<1>>>0)+1
if(!(h<i))return A.a(p,h)
p[h]=-1}else if(h===0)return!1
l+=p[j]+(B.a.X(b,k)&1);--m
if(m===0){if(!(s<128))return A.a(r,s)
r[s]=l}}if(g.fY(l))g.fZ(l,0)
else if(g.ds(l))return!1
r=g.d
r===$&&A.c("tree")
q=l<<1>>>0
if(!(q<r.length))return A.a(r,q)
r[q]=a
return!0},
dD(a,b){var s=B.M[a&15],r=B.a.i(a,4)
if(!(r<16))return A.a(B.M,r)
return B.a.Z((s<<4|B.M[r])>>>0,8-b)},
fZ(a,b){var s,r=this.d
r===$&&A.c("tree")
s=(a<<1>>>0)+1
if(!(s<r.length))return A.a(r,s)
r[s]=b},
ds(a){var s,r=this.d
r===$&&A.c("tree")
s=(a<<1>>>0)+1
if(!(s<r.length))return A.a(r,s)
return r[s]!==0},
fY(a){var s,r=this.d
r===$&&A.c("tree")
s=(a<<1>>>0)+1
if(!(s<r.length))return A.a(r,s)
return r[s]<0},
fR(a,b,c){var s,r,q,p,o,n,m,l,k,j,i=t.L
i.a(a)
i.a(c)
s=new Int32Array(16)
r=new Int32Array(16)
for(i=a.length,q=0,p=0;q<b;++q){if(!(q<i))return A.a(a,q)
o=a[q]
if(o>p)p=o}if(p>15)return!1
for(q=0;q<b;++q){if(!(q<i))return A.a(a,q)
n=a[q]
if(!(n>=0&&n<16))return A.a(s,n)
m=s[n]
if(!(n<16))return A.a(s,n)
s[n]=m+1}if(0>=16)return A.a(s,0)
s[0]=0
if(0>=16)return A.a(r,0)
r[0]=-1
for(l=1,k=0;l<=p;++l){k=k+s[l-1]<<1>>>0
if(!(l<16))return A.a(r,l)
r[l]=k}for(n=c.length,q=0;q<b;++q){if(!(q<i))return A.a(a,q)
m=a[q]
if(m>0){if(!(m<16))return A.a(r,m)
j=r[m]
if(!(m<16))return A.a(r,m)
r[m]=j+1
if(!(q<n))return A.a(c,q)
c[q]=j}else{if(!(q<n))return A.a(c,q)
c[q]=-1}}return!0}}
A.bL.prototype={}
A.cR.prototype={}
A.cp.prototype={}
A.hx.prototype={
b1(a){var s=A.l(t.L.a(a),!1,null,0)
this.b=s
if(!this.d9(s))return!1
return!0},
am(a){var s,r=this,q=null,p=A.l(t.L.a(a),!1,q,0)
r.b=p
if(!r.d9(p))return q
p=new A.cp(A.b([],t.J))
r.a=p
s=r.b
s.toString
if(!r.dL(s,p))return q
p=r.a
switch(p.f){case 3:p.as=p.z.length
return p
case 2:s=r.b
s.toString
s.d=p.ay
if(!A.jj(s,p).bi())return q
p=r.a
p.as=p.z.length
return p
case 1:s=r.b
s.toString
s.d=p.ay
if(!A.jh(s,p).bi())return q
p=r.a
p.as=p.z.length
return p}return q},
Y(a){var s,r,q,p,o=this,n=o.b
if(n==null||o.a==null)return null
s=o.a
if(s.e){s=s.z
r=s.length
if(a>=r||!1)return null
if(!(a<r))return A.a(s,a)
q=s[a]
n.toString
s=q.x
s===$&&A.c("_frameSize")
r=q.w
r===$&&A.c("_framePosition")
return o.d3(n.aJ(s,r),a)}r=s.f
if(r===2){n.toString
p=n.aJ(s.ch,s.ay)
n=o.a
n.toString
return A.jj(p,n).ap()}else if(r===1){n.toString
p=n.aJ(s.ch,s.ay)
n=o.a
n.toString
return A.jh(p,n).ap()}return null},
a5(a){var s
this.am(t.L.a(a))
s=this.a
s.Q=0
s.as=1
return this.Y(0)},
d3(a,b){var s,r,q,p=null,o=A.b([],t.J),n=new A.cp(o)
if(!this.dL(a,n))return p
if(n.f===0)return p
s=this.a
n.Q=s.Q
n.as=s.as
if(n.e){s=o.length
if(b>=s||!1)return p
if(!(b<s))return A.a(o,b)
r=o[b]
o=r.x
o===$&&A.c("_frameSize")
s=r.w
s===$&&A.c("_framePosition")
return this.d3(a.aJ(o,s),b)}else{q=a.aJ(n.ch,n.ay)
o=n.f
if(o===2)return A.jj(q,n).ap()
else if(o===1)return A.jh(q,n).ap()}return p},
d9(a){if(a.L(4)!=="RIFF")return!1
a.j()
if(a.L(4)!=="WEBP")return!1
return!0},
dL(a,b){var s,r,q,p,o,n,m,l,k,j,i,h=a.b,g=a.c,f=!1
while(!0){if(!(a.d<g&&!f))break
s=a.L(4)
r=a.j()
q=r+1>>>1<<1>>>0
p=a.d
o=p-h
switch(s){case"VP8X":if(!this.fP(a,b))return!1
break
case"VP8 ":b.ay=o
b.ch=r
b.f=1
f=!0
break
case"VP8L":b.ay=o
b.ch=r
b.f=2
f=!0
break
case"ALPH":n=a.a
m=a.e
l=n.length
n=new A.Y(n,0,l,0,m)
b.at=n
n.d=p
a.d+=q
break
case"ANIM":b.f=3
k=a.j()
a.k()
B.c.n(B.a.p(k&255,0,255))
B.c.n(B.a.p(k>>>24&255,0,255))
B.c.n(B.a.p(k>>>16&255,0,255))
B.c.n(B.a.p(k>>>8&255,0,255))
break
case"ANMF":if(!this.fL(a,b,r))return!1
break
case"ICCP":b.toString
j=a.N(r)
a.d=a.d+(j.c-j.d)
j.S()
break
case"EXIF":b.toString
a.L(r)
break
case"XMP ":b.toString
a.L(r)
break
default:A.lo("UNKNOWN WEBP TAG: "+s)
a.d+=q
break}p=a.d
i=q-(p-h-o)
if(i>0)a.d=p+i}if(!b.d)b.d=b.at!=null
return b.f!==0},
fP(a,b){var s,r,q,p,o=a.q()
if((o&192)!==0)return!1
s=B.a.i(o,4)
r=B.a.i(o,1)
if((o&1)!==0)return!1
if(a.a9()!==0)return!1
q=a.a9()
p=a.a9()
b.a=q+1
b.b=p+1
b.e=(r&1)!==0
b.d=(s&1)!==0
return!0},
fL(a,b,c){var s
a.a9()
a.a9()
a.a9()
a.a9()
a.a9()
s=new A.dS()
s.eL(a,c)
if(s.r!==0)return!1
B.b.v(b.z,s)
return!0}}
A.dB.prototype={
eD(a,b,c){var s,r,q,p,o,n,m,l=this,k=a.a,j=a.b
l.bf(A.fl("R",k,j,c,b))
l.bf(A.fl("G",k,j,c,b))
l.bf(A.fl("B",k,j,c,b))
if(a.c===B.i)l.bf(A.fl("A",k,j,c,b))
s=a.aH()
for(r=s.length,q=0,p=0;q<j;++q)for(o=0;o<k;++o){n=l.b
n.toString
m=p+1
if(!(p>=0&&p<r))return A.a(s,p)
n.az(o,q,s[p]/255)
n=l.c
n.toString
p=m+1
if(!(m>=0&&m<r))return A.a(s,m)
n.az(o,q,s[m]/255)
n=l.d
n.toString
m=p+1
if(!(p>=0&&p<r))return A.a(s,p)
n.az(o,q,s[p]/255)
n=l.e
if(n!=null){p=m+1
if(!(m>=0&&m<r))return A.a(s,m)
n.az(o,q,s[m]/255)}else p=m}},
gea(a){var s=this.a
if(s.a===0)s=0
else{s=s.gau()
s=s.b.$1(J.dj(s.a)).b}return s},
gaD(a){var s=this.a
if(s.a===0)s=0
else{s=s.gau()
s=s.b.$1(J.dj(s.a)).c}return s},
aI(a,b,c){var s=this.b
if(s!=null)if(s.d===3)s.az(a,b,c)
else s.bx(a,b,A.n(c))},
b7(a,b,c){var s=this.c
if(s!=null)if(this.b.d===3)s.az(a,b,c)
else s.bx(a,b,A.n(c))},
bw(a,b,c){var s
if(this.c!=null){s=this.d
if(s.d===3)s.az(a,b,c)
else s.bx(a,b,A.n(c))}},
cI(a,b,c){var s=this.e
if(s!=null)if(s.d===3)s.az(a,b,c)
else s.bx(a,b,A.n(c))},
bf(a){var s=this,r=a.a
s.a.h(0,r,a)
switch(r){case"R":s.b=a
break
case"G":s.c=a
break
case"B":s.d=a
break
case"A":s.e=a
break
case"Z":break}}}
A.cl.prototype={
bv(a,b){var s,r,q,p=this,o=b*p.b+a,n=p.d,m=n===1
if(m||n===0){n=p.f
if(!(o>=0&&o<n.length))return A.a(n,o)
n=A.n(n[o])
s=p.e
if(s===8)r=255
else r=s===16?65535:4294967295
return n/(m?r-1:r)}n=n===3&&p.e===16
m=p.f
s=m.length
if(n){if(!(o>=0&&o<s))return A.a(m,o)
n=A.n(m[o])
if($.L==null)A.aD()
m=$.L
if(!(n>=0&&n<m.length))return A.a(m,n)
q=m[n]}else{if(!(o>=0&&o<s))return A.a(m,o)
q=m[o]}return q},
az(a,b,c){var s,r,q,p=this
if(p.d!==3)return
s=b*p.b+a
r=p.f
q=J.J(r)
if(p.e===16)q.h(r,s,A.mm(c))
else q.h(r,s,c)},
bx(a,b,c){J.m(this.f,b*this.b+a,c)}}
A.iG.prototype={
$2(a,b){return Math.log(a*b+1)/b},
$S:13}
A.iF.prototype={
$2(a,b){var s,r=Math.max(0,a*b)
if(r>1){s=this.a.$2(r-1,0.184874)
if(typeof s!=="number")return A.P(s)
r=1+s}return Math.pow(r,0.4545)*84.66},
$S:13}
A.aC.prototype={
t(a){return"Format."+this.b}}
A.dn.prototype={
t(a){return"Channels."+this.b}}
A.dE.prototype={
aH(){var s,r,q,p,o,n,m,l,k=this,j=k.x,i=A.N(j.buffer,0,null)
switch(B.U){case B.U:return i
case B.aA:s=k.a*k.b*4
r=new Uint8Array(s)
for(j=i.length,q=0;q<s;q+=4){p=q+2
if(!(p<j))return A.a(i,p)
o=i[p]
if(!(q<s))return A.a(r,q)
r[q]=o
o=q+1
if(!(o<j))return A.a(i,o)
n=i[o]
if(!(o<s))return A.a(r,o)
r[o]=n
if(!(q<j))return A.a(i,q)
n=i[q]
if(!(p<s))return A.a(r,p)
r[p]=n
n=q+3
if(!(n<j))return A.a(i,n)
p=i[n]
if(!(n<s))return A.a(r,n)
r[n]=p}return r
case B.az:s=k.a*k.b*4
r=new Uint8Array(s)
for(j=i.length,q=0;q<s;q+=4){p=q+3
if(!(p<j))return A.a(i,p)
o=i[p]
if(!(q<s))return A.a(r,q)
r[q]=o
o=q+1
n=q+2
if(!(n<j))return A.a(i,n)
m=i[n]
if(!(o<s))return A.a(r,o)
r[o]=m
if(!(o<j))return A.a(i,o)
o=i[o]
if(!(n<s))return A.a(r,n)
r[n]=o
if(!(q<j))return A.a(i,q)
o=i[q]
if(!(p<s))return A.a(r,p)
r[p]=o}return r
case B.ay:s=k.a*k.b*4
r=new Uint8Array(s)
for(j=i.length,q=0;q<s;q+=4){p=q+3
if(!(p<j))return A.a(i,p)
o=i[p]
if(!(q<s))return A.a(r,q)
r[q]=o
o=q+1
if(!(q<j))return A.a(i,q)
n=i[q]
if(!(o<s))return A.a(r,o)
r[o]=n
n=q+2
if(!(o<j))return A.a(i,o)
o=i[o]
if(!(n<s))return A.a(r,n)
r[n]=o
if(!(n<j))return A.a(i,n)
n=i[n]
if(!(p<s))return A.a(r,p)
r[p]=n}return r
case B.aB:s=k.a*k.b*3
r=new Uint8Array(s)
for(j=i.length,q=0,l=0;l<s;q+=4,l+=3){if(!(q<j))return A.a(i,q)
p=i[q]
if(!(l<s))return A.a(r,l)
r[l]=p
p=l+1
o=q+1
if(!(o<j))return A.a(i,o)
o=i[o]
if(!(p<s))return A.a(r,p)
r[p]=o
o=l+2
p=q+2
if(!(p<j))return A.a(i,p)
p=i[p]
if(!(o<s))return A.a(r,o)
r[o]=p}return r
case B.aC:s=k.a*k.b*3
r=new Uint8Array(s)
for(j=i.length,q=0,l=0;l<s;q+=4,l+=3){p=q+2
if(!(p<j))return A.a(i,p)
p=i[p]
if(!(l<s))return A.a(r,l)
r[l]=p
p=l+1
o=q+1
if(!(o<j))return A.a(i,o)
o=i[o]
if(!(p<s))return A.a(r,p)
r[p]=o
o=l+2
if(!(q<j))return A.a(i,q)
p=i[q]
if(!(o<s))return A.a(r,o)
r[o]=p}return r
case B.aD:p=k.a*k.b
r=new Uint8Array(p)
for(s=j.length,q=0;q<s;++q){o=j[q]
o=B.c.ak(0.299*(o&255)+0.587*(o>>>8&255)+0.114*(o>>>16&255))
if(!(q<p))return A.a(r,q)
r[q]=o}return r}},
M(a,b){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e=this
t.cc.a(b)
s=Math.min(e.b,A.lf(b.gaD(b)))
r=e.a
q=Math.min(r,A.lf(b.gea(b)))
for(p=e.x,o=p.length,n=0;n<s;++n)for(m=n*r,l=0;l<q;++l){k=m+l
if(!(k>=0&&k<o))return A.a(p,k)
j=p[k]
i=b.j6(l,n)
h=i.M(0,255)
g=i.X(0,8)
f=i.X(0,16)
p[k]=(B.c.n(B.a.p(j>>>24&255&i.X(0,24)&255,0,255))<<24|B.c.n(B.a.p(j>>>16&255&f&255,0,255))<<16|B.c.n(B.a.p(j>>>8&255&g&255,0,255))<<8|B.c.n(B.a.p(j&255&h,0,255)))>>>0}return e},
gu(a){return this.x.length},
eh(a,b,c){var s=this.x,r=b*this.a+a
if(!(r>=0&&r<s.length))return A.a(s,r)
s[r]=c},
hU(a){var s,r,q,p
t.ck.a(a)
if(this.Q==null){s=t.N
this.siU(A.H(s,s))}for(s=A.fB(a,a.r,A.y(a).c);s.B();){r=s.d
q=this.Q
q.toString
p=a.m(0,r)
p.toString
q.h(0,r,p)}},
siU(a){this.Q=t.cZ.a(a)}}
A.fq.prototype={
t(a){return"ImageException: "+this.a}}
A.Y.prototype={
gu(a){return this.c-this.d},
h(a,b,c){J.m(this.a,this.d+b,c)
return c},
a8(a,b,c,d){var s=this.a,r=J.J(s),q=this.d+a
if(c instanceof A.Y)r.W(s,q,q+b,c.a,c.d+d)
else r.W(s,q,q+b,t.L.a(c),d)},
aF(a,b,c){return this.a8(a,b,c,0)},
iv(a,b,c){var s=this.a,r=this.d+a
J.ax(s,r,r+b,c)},
bX(a,b,c){var s=this,r=c!=null?s.b+c:s.d
return A.l(s.a,s.e,a,r+b)},
N(a){return this.bX(a,0,null)},
aJ(a,b){return this.bX(a,0,b)},
aT(a,b){return this.bX(a,b,null)},
q(){var s=this.a,r=this.d++
if(!(r>=0&&r<s.length))return A.a(s,r)
return s[r]},
V(a){var s=this.N(a)
this.d=this.d+(s.c-s.d)
return s},
L(a){var s,r,q,p,o=this
if(a==null){s=A.b([],t.t)
for(r=o.c;q=o.d,q<r;){p=o.a
o.d=q+1
if(!(q>=0&&q<p.length))return A.a(p,q)
q=p[q]
if(q===0)return A.fY(s,0,null)
B.b.v(s,q)}throw A.d(A.f(u.c))}return A.fY(o.V(a).S(),0,null)},
bp(){return this.L(null)},
iL(){var s,r,q,p=this,o=A.b([],t.t)
for(s=p.c;r=p.d,r<s;){q=p.a
p.d=r+1
if(!(r>=0&&r<q.length))return A.a(q,r)
r=q[r]
if(r===0){t.L.a(o)
return B.fQ.ct(o)}B.b.v(o,r)}throw A.d(A.f(u.c))},
k(){var s,r,q=this,p=q.a,o=q.d,n=q.d=o+1,m=p.length
if(!(o>=0&&o<m))return A.a(p,o)
o=p[o]
if(typeof o!=="number")return o.M()
s=o&255
q.d=n+1
if(!(n>=0&&n<m))return A.a(p,n)
n=p[n]
if(typeof n!=="number")return n.M()
r=n&255
if(q.e)return s<<8|r
return r<<8|s},
a9(){var s,r,q,p=this,o=p.a,n=p.d,m=p.d=n+1,l=o.length
if(!(n>=0&&n<l))return A.a(o,n)
n=o[n]
if(typeof n!=="number")return n.M()
s=n&255
n=p.d=m+1
if(!(m>=0&&m<l))return A.a(o,m)
m=o[m]
if(typeof m!=="number")return m.M()
r=m&255
p.d=n+1
if(!(n>=0&&n<l))return A.a(o,n)
n=o[n]
if(typeof n!=="number")return n.M()
q=n&255
if(p.e)return q|r<<8|s<<16
return s|r<<8|q<<16},
j(){var s,r,q,p,o=this,n=o.a,m=o.d,l=o.d=m+1,k=n.length
if(!(m>=0&&m<k))return A.a(n,m)
m=n[m]
if(typeof m!=="number")return m.M()
s=m&255
m=o.d=l+1
if(!(l>=0&&l<k))return A.a(n,l)
l=n[l]
if(typeof l!=="number")return l.M()
r=l&255
l=o.d=m+1
if(!(m>=0&&m<k))return A.a(n,m)
m=n[m]
if(typeof m!=="number")return m.M()
q=m&255
o.d=l+1
if(!(l>=0&&l<k))return A.a(n,l)
l=n[l]
if(typeof l!=="number")return l.M()
p=l&255
if(o.e)return(s<<24|r<<16|q<<8|p)>>>0
return(p<<24|q<<16|r<<8|s)>>>0},
bU(){return A.pa(this.cB())},
cB(){var s,r,q,p,o,n,m,l,k=this,j=k.a,i=k.d,h=k.d=i+1,g=j.length
if(!(i>=0&&i<g))return A.a(j,i)
i=j[i]
if(typeof i!=="number")return i.M()
s=i&255
i=k.d=h+1
if(!(h>=0&&h<g))return A.a(j,h)
h=j[h]
if(typeof h!=="number")return h.M()
r=h&255
h=k.d=i+1
if(!(i>=0&&i<g))return A.a(j,i)
i=j[i]
if(typeof i!=="number")return i.M()
q=i&255
i=k.d=h+1
if(!(h>=0&&h<g))return A.a(j,h)
h=j[h]
if(typeof h!=="number")return h.M()
p=h&255
h=k.d=i+1
if(!(i>=0&&i<g))return A.a(j,i)
i=j[i]
if(typeof i!=="number")return i.M()
o=i&255
i=k.d=h+1
if(!(h>=0&&h<g))return A.a(j,h)
h=j[h]
if(typeof h!=="number")return h.M()
n=h&255
h=k.d=i+1
if(!(i>=0&&i<g))return A.a(j,i)
i=j[i]
if(typeof i!=="number")return i.M()
m=i&255
k.d=h+1
if(!(h>=0&&h<g))return A.a(j,h)
h=j[h]
if(typeof h!=="number")return h.M()
l=h&255
if(k.e)return(B.a.A(s,56)|B.a.A(r,48)|B.a.A(q,40)|B.a.A(p,32)|o<<24|n<<16|m<<8|l)>>>0
return(B.a.A(l,56)|B.a.A(m,48)|B.a.A(n,40)|B.a.A(o,32)|p<<24|q<<16|r<<8|s)>>>0},
br(a,b,c){var s,r=this,q=r.a
if(t.D.b(q))return r.e8(b,c)
s=r.b+b+b
return J.iS(q,s,c<=0?r.c:s+c)},
e8(a,b){var s,r=this,q=b==null?r.c-r.d-a:b,p=r.a
if(t.D.b(p))return A.N(p.buffer,p.byteOffset+r.d+a,q)
s=r.d+a
s=J.iS(p,s,s+q)
return new Uint8Array(A.ob(s))},
S(){return this.e8(0,null)},
bs(){var s=this.a
if(t.D.b(s))return A.j6(s.buffer,s.byteOffset+this.d,null)
return A.j6(this.S().buffer,0,null)},
scq(a,b){this.a=t.L.a(b)}}
A.fH.prototype={
ad(a){var s,r,q=this
if(q.a===q.c.length)q.fE()
s=q.c
r=q.a++
if(!(r>=0&&r<s.length))return A.a(s,r)
s[r]=a&255},
ee(a){this.ad(a&255)
this.ad(B.a.i(a,8)&255)},
bV(a){var s=this
s.ad(a&255)
s.ad(a>>>8&255)
s.ad(a>>>16&255)
s.ad(a>>>24&255)},
fF(a){var s,r,q=this.c.length,p=q===0?8192:q*2
q=this.c
s=q.length
r=new Uint8Array(s+p)
B.d.by(r,0,s,q)
this.c=r},
fE(){return this.fF(null)},
gu(a){return this.a}}
A.iz.prototype={
$0(){var s=$.Z
if(s!=null){s=s.c
if(s!=null)s.bd(700,"terminating Web worker")}s=this.a
s.port1.close()
s.port2.close()
this.b.close()},
$S:1}
A.iA.prototype={
$1(a){return this.a.bo(t.f.a(new A.eH([],[]).dQ(t.e.a(a).data,!0)))},
$S:16}
A.iB.prototype={
$1(a){return this.a.bR(t.fF.a(new A.eH([],[]).dQ(t.e.a(a).data,!0)),this.b.port2,this.c)},
$S:16}
A.hO.prototype={
aK(a,b){var s,r,q,p,o=t.ds.a(a).aw()
try{if(b){q=$.lv().cb(o,A.mv(t.K))
s=A.kk(q,!0,q.$ti.l("k.E"))
q=this.a
q.toString
B.an.e0(q,o,s)}else{q=this.a
q.toString
B.an.iA(q,o)}}catch(p){r=A.a1(p)
A.kE("failed to post response "+A.r(o)+": error "+A.r(r))
throw p}}}
A.eO.prototype={
ig(a,b){var s,r=null,q=new A.i8(b),p=$.Z,o=p==null,n=o?r:p.c
if(n!=null)n.bd(1,q)
else if(o?$.aZ:p.d){s=q.$0()
A.jH("[DEBUG] "+A.r(s))}this.aK(new A.bw(!1,A.jd(b,r),r,r),!1)},
$inE:1}
A.i8.prototype={
$0(){return"replying with error: "+this.a.t(0)},
$S:38}
A.ey.prototype={
fV(a){return a==null||typeof a=="string"||typeof a=="number"||A.dc(a)},
ci(a){if(a==null||typeof a=="string"||typeof a=="number"||A.dc(a))return!0
if(t.dy.b(a)||t.bj.b(a)||t.fx.b(a))return!0
if(t.j.b(a)&&J.lS(a,this.gdl()))return!0
if(t.f.b(a)&&a.gaE().aO(0,this.gdk())&&a.gau().aO(0,this.gdl()))return!0
return!1},
ce(a,b){return this.fO(a,t.bC.a(b))},
fO(a,b){var s=this
return A.l9(function(){var r=a,q=b
var p=0,o=1,n,m,l,k,j
return function $async$ce(c,d){if(c===1){n=d
p=o}while(true)switch(p){case 0:m=J.lU(r,new A.hd(s)),m=m.gU(m),l=t.K
case 2:if(!m.B()){p=3
break}k=m.gE()
p=!q.ah(0,k)?4:5
break
case 4:j=k==null
q.v(0,j?l.a(k):k)
p=6
return j?l.a(k):k
case 6:case 5:p=2
break
case 3:return A.kU()
case 1:return A.kV(n)}}},t.K)},
cb(a,b){return this.fK(a,t.bC.a(b))},
fK(a,b){var s=this
return A.l9(function(){var r=a,q=b
var p=0,o=2,n,m,l,k,j,i
return function $async$cb(c,d){if(c===1){n=d
p=o}while(true)switch(p){case 0:if(s.ci(r)){p=1
break}if(!r.gaE().aO(0,s.gdk()))throw A.d(A.aw("Keys must be strings, numbers or booleans."))
m=A.b([],t.a)
B.b.an(m,s.ce(r.gau(),q))
l=t.R,k=t.f
case 3:if(!(j=m.length,j!==0)){p=4
break}if(0>=j){A.a(m,-1)
p=1
break}i=m.pop()
p=k.b(i)?5:7
break
case 5:B.b.an(m,s.cb(i,q))
p=6
break
case 7:p=l.b(i)?8:10
break
case 8:B.b.an(m,s.ce(i,q))
p=9
break
case 10:p=11
return i
case 11:case 9:case 6:p=3
break
case 4:case 1:return A.kU()
case 2:return A.kV(n)}}},t.K)}}
A.hd.prototype={
$1(a){return!this.a.ci(a)},
$S:4}
A.bG.prototype={
cr(){var s,r,q,p,o=this
if(o.b==null){s=A.lZ(null,o.c,null,null)
o.b=s}s=o.d
if(s==null)s=B.a9
r=s.length
q=t.Z
p=0
for(;p<s.length;s.length===r||(0,A.di)(s),++p)A.lq(q.a(s[p]))},
hT(a){var s
t.M.a(a)
if(this.b!=null)A.lq(a)
else{s=this.d
if(s==null){s=A.b([],t.bT)
this.sfX(s)}B.b.v(s,a)}},
iP(a){var s
t.M.a(a)
s=this.d
return s==null?null:B.b.bq(s,a)},
sfX(a){this.d=t.eX.a(a)}}
A.fU.prototype={}
A.cH.prototype={
eJ(a,b){var s
if(this.b==null)try{this.b=A.kF()}catch(s){}},
aw(){var s=this.b
s=s==null?null:s.t(0)
return["$",this.a,s]},
t(a){return B.S.dS(this.aw(),null)},
$iaY:1}
A.aY.prototype={
t(a){return B.S.dS(this.aw(),null)}}
A.dl.prototype={
bd(a,b){var s,r,q,p,o,n,m,l=null
if(a<this.a)if(a===1){s=$.Z
s=s==null?$.aZ:s.d}else s=!1
else s=!0
if(s){if(t.Y.b(b))b=b.$0()
s=new A.bg(Date.now(),!1).iX().iW()
r=A.mN(a)
q=$.Z
q=q==null?l:q.e
if(t.R.b(b)){p=J.lT(b,new A.f2(),t.N)
o=A.y(p)
n=o.l("cf<k.E,v>")
m=new A.S(new A.cf(p,o.l("k<v>(k.E)").a(new A.f3()),n),n.l("B(k.E)").a(new A.f4()),n.l("S<k.E>"))}else{m=b==null?l:new A.S(A.b(J.bD(b).split("\n"),t.s),t.bB.a(new A.f5()),t.dN)
if(m==null)m=B.cY}for(p=J.as(m),q="["+s+"] ["+r+"] ["+A.r(q)+"] ",r=this.b;p.B();){s=q+p.gE()
r.aK(new A.bw(!1,l,s,l),!1)}}},
$ikD:1}
A.f2.prototype={
$1(a){var s=a==null?null:J.bD(a)
return s==null?"":s},
$S:39}
A.f3.prototype={
$1(a){return A.b(A.aN(a).split("\n"),t.s)},
$S:40}
A.f4.prototype={
$1(a){return A.aN(a).length!==0},
$S:15}
A.f5.prototype={
$1(a){return A.aN(a).length!==0},
$S:15}
A.eb.prototype={}
A.bW.prototype={
bY(a,b,c,d){var s
if(this.b==null)try{this.b=A.kF()}catch(s){}},
aw(){var s=this,r=s.b
r=r==null?null:r.t(0)
return["$W",s.a,r,s.c,s.d]}}
A.bH.prototype={
aw(){var s=this,r=s.b
r=r==null?null:r.t(0)
return["$C",s.a,r,s.c,s.d]}}
A.eu.prototype={
aw(){var s,r,q,p=this,o=p.b
o=o==null?null:o.t(0)
s=p.c
r=p.d
q=p.x.gj8()
return["$T",p.a,o,s,r,q]},
$ikH:1}
A.aq.prototype={}
A.bw.prototype={
aw(){var s,r,q=this,p=q.b
if(p!=null){s=A.H(t.N,t.z)
s.h(0,"b",p.aw())
p=$.Z
if(p==null?$.aZ:p.d)s.h(0,"d",1000*Date.now())
return s}else{p=q.d
if(p!=null){s=A.H(t.N,t.z)
s.h(0,"e",p)
p=$.Z
if(p==null?$.aZ:p.d)s.h(0,"d",1000*Date.now())
return s}else if(q.a){p=A.H(t.N,t.z)
p.h(0,"c",!0)
s=$.Z
if(s==null?$.aZ:s.d)p.h(0,"d",1000*Date.now())
return p}else{p=q.e
s=t.N
r=t.z
if(p==null){p=A.H(s,r)
s=$.Z
if(s==null?$.aZ:s.d)p.h(0,"d",1000*Date.now())
return p}else{s=A.H(s,r)
s.h(0,"a",p)
p=$.Z
if(p==null?$.aZ:p.d)s.h(0,"d",1000*Date.now())
return s}}}}}
A.aU.prototype={}
A.fT.prototype={}
A.hy.prototype={
dg(a){return a==null?$.lt():this.d.iE(a.a,new A.hz(a))},
shQ(a){this.e=t.ec.a(a)}}
A.hz.prototype={
$0(){var s=this.a.a,r=new A.aU(!0,++$.jJ().a,null)
r.a=s
return r},
$S:42}
A.hB.prototype={
bR(a,b,c){return this.i2(a,b,t.he.a(c))},
i2(a2,a3,a4){var s=0,r=A.jC(t.z),q=1,p,o=this,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1
var $async$bR=A.jD(function(a5,a6){if(a5===1){p=a6
s=q}while(true)switch(s){case 0:b=A.kQ(a2)
a=b
a0=a==null?null:a.a
if(b==null)throw A.d(A.aw("connection request expected"))
else if(a0==null)throw A.d(A.aw("missing client for connection request"))
q=3
if(b.d!==-1){a=A.aw("connection request expected")
throw A.d(a)}else{a=o.a
if(a.a!==0){a=A.aw("already connected")
throw A.d(a)}}i=b.f
i.toString
h=A.je()
if(h.e==null){g=B.e.j_(i)
if(g.length!==0)h.e=g}i=a0
h=A.je()
if(h.f==null){h.f=i
f=$.Z
e=f==null
if(e)d=null
else{d=f.c
d=d==null?null:d.a}if(d==null)f=e?null:f.a
else f=d
h.c=new A.eb(i,f==null?2000:f)}i=b.r
i.toString
h=A.je()
f=h.c
if(f!=null)f.a=i
h.a=i
i=b.x!=null
f=$.Z
if(f==null)$.aZ=i
else f.d=i
n=null
m=a4.$1(b)
s=t.c.b(m)?6:8
break
case 6:s=9
return A.ju(m,$async$bR)
case 9:n=a6
s=7
break
case 8:n=m
case 7:l=n.giy()
i=l
f=A.a5(i).l("an<1>")
f=new A.S(new A.an(i,f),f.l("B(k.E)").a(new A.hC()),f.l("S<k.E>"))
if(!f.ga7(f)){a=A.aw("invalid command identifier in service operations map; command ids must be > 0")
throw A.d(a)}a.an(0,l)
a0.aK(A.hA(a3),!0)
q=1
s=5
break
case 3:q=2
a1=p
k=A.a1(a1)
j=A.af(a1)
J.jQ(a0,A.jd(k,j))
s=5
break
case 2:s=1
break
case 5:return A.jw(null,r)
case 1:return A.jv(p,r)}})
return A.jx($async$bR,r)},
bo(a){return this.iD(a)},
iD(b0){var s=0,r=A.jC(t.z),q,p=2,o,n=[],m=this,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9
var $async$bo=A.jD(function(b1,b2){if(b1===1){o=b2
s=p}while(true)switch(s){case 0:a6=A.kQ(b0)
a7=a6
a8=a7==null?null:a7.a
if(a6==null)throw A.d(A.aw("invalid message"))
else if(a6.d===-4){a7=m.b
if(a7.c===0)a7.a.$0()
else a7.b=!0
q=null
s=1
break}else if(a6.d===-3){a7=a6.b
a7.toString
a7=m.b.dg(a7)
if(a7.e)a7.eo()
q=null
s=1
break}else if(a6.d===-2){a7=a6.c
a7.toString
b=m.b.e
if(b==null)a7=null
else{a7=b.m(0,a7)
a7=a7==null?null:a7.$0()}q=a7
s=1
break}else if(a8==null)throw A.d(A.aw("missing client for request: "+A.r(a6)))
a7=m.b
b=t.gH.a(a6);++a7.c
a=a7.dg(b.b)
if(a.e){++a.f
a0=b.b
if(a0==null||a0.a!==a.a)A.D(A.aw("cancellation token mismatch"))
b.b=a}else if(b.b!=null)A.D(A.aw("Token reference mismatch"))
l=a
p=4
if(a6.d===-1){b=A.aw("unexpected connection request: "+b0.t(0))
throw A.d(b)}else{b=m.a
if(b.a===0){b=A.jk("worker service is not ready",null,null,null)
throw A.d(b)}}k=b.m(0,a6.d)
if(k==null){b=A.jk("unknown command: "+a6.d,null,null,null)
throw A.d(b)}j=k.$1(a6)
s=t.c.b(j)?7:8
break
case 7:s=9
return A.ju(j,$async$bo)
case 9:j=b2
case 8:i=a6.w
if(j instanceof A.bS){t.fN.a(j)
b=!0}else b=!1
s=b?10:12
break
case 10:h=A.ar("subscription")
g=new A.bx(new A.G($.A,t.d),t.fz)
f=new A.hF(a8,h,g)
b=t.w.a(l)
a0=t.M
a1=a0.a(f)
a2=++a7.f
a3=a7.e
if(a3==null){a0=A.H(t.p,a0)
a7.shQ(a0)}else a0=a3
a0.h(0,a2,a1)
if(b.e)b.en(a1)
e=a2
a8.aK(A.hA(A.n(e)),!1)
b=h
a0=j
a1=A.a5(a0)
a2=a1.l("~(1)?").a(new A.hD(a8,i))
t.Z.a(f)
a1=A.hS(a0.a,a0.b,a2,!1,a1.c)
a0=b.b
if(a0==null?b!=null:a0!==b)A.D(new A.bn("Local '"+b.a+"' has already been initialized."))
b.b=a1
b=g.a
a4=t.O.a(new A.hE(m,l,e))
a0=b.$ti
j=new A.G($.A,a0)
b.bB(new A.aM(j,8,a4,null,a0.l("@<1>").D(a0.c).l("aM<1,2>")))
s=13
return A.ju(j,$async$bo)
case 13:s=11
break
case 12:b=j
a0=A.js(i)
a8.aK(A.hA(b),a0)
case 11:n.push(6)
s=5
break
case 4:p=3
a9=o
d=A.a1(a9)
c=A.af(a9)
J.jQ(a8,A.jd(d,c))
n.push(6)
s=5
break
case 3:n=[2]
case 5:p=2
b=t.w.a(l)
if(b.e)--b.f
if(b.f===0&&b.b==null)a7.d.bq(0,b.a)
b=--a7.c
if(a7.b&&b===0)a7.a.$0()
s=n.pop()
break
case 6:case 1:return A.jw(q,r)
case 2:return A.jv(o,r)}})
return A.jx($async$bo,r)}}
A.hC.prototype={
$1(a){return A.n(a)<=0},
$S:43}
A.hF.prototype={
$0(){this.a.aK($.lI(),!1)
this.b.I().cr()
this.c.i1()},
$S:1}
A.hD.prototype={
$1(a){return this.a.aK(A.hA(a),this.b)},
$S:3}
A.hE.prototype={
$0(){var s=this.a.b,r=this.b,q=this.c,p=s.e,o=p==null?null:p.m(0,q)
if(o!=null){t.M.a(o)
if(r.e)r.ep(o)
s=s.e
if(s!=null)s.bq(0,q)}},
$S:5};(function aliases(){var s=J.aV.prototype
s.ex=s.t
s=A.ah.prototype
s.es=s.dU
s.eu=s.dV
s.ew=s.dX
s.ev=s.dW
s=A.u.prototype
s.cO=s.W
s=A.k.prototype
s.er=s.aR
s=A.aA.prototype
s.eq=s.cp
s=A.bG.prototype
s.eo=s.cr
s.en=s.hT
s.ep=s.iP})();(function installTearOffs(){var s=hunkHelpers._static_1,r=hunkHelpers._static_0,q=hunkHelpers._static_2,p=hunkHelpers._instance_2u,o=hunkHelpers._instance_1u,n=hunkHelpers.installStaticTearOff
s(A,"or","mi",19)
s(A,"oE","nG",11)
s(A,"oF","nH",11)
s(A,"oG","nI",11)
r(A,"le","ox",1)
q(A,"lg","o8",46)
s(A,"oK","o9",19)
s(A,"lh","oa",18)
var m
p(m=A.dW.prototype,"gfi","fj",10)
p(m,"gfl","fm",10)
p(m,"gfn","fo",17)
p(m,"gfd","fe",10)
p(m,"gff","fg",17)
s(A,"pv","ne",0)
s(A,"pm","n5",0)
s(A,"pf","mZ",0)
s(A,"ps","nb",0)
s(A,"pt","nc",0)
s(A,"pr","na",0)
s(A,"pq","n9",0)
s(A,"pp","n8",0)
s(A,"py","nh",0)
s(A,"px","ng",0)
s(A,"po","n7",0)
s(A,"pk","n3",0)
s(A,"pu","nd",0)
s(A,"pl","n4",0)
s(A,"pb","mV",0)
s(A,"pd","mX",0)
s(A,"pc","mW",0)
s(A,"pe","mY",0)
s(A,"pw","nf",0)
s(A,"pn","n6",0)
s(A,"pg","n_",0)
s(A,"ph","n0",0)
s(A,"pi","n1",0)
s(A,"pj","n2",0)
o(A.cM.prototype,"ghh","hi",8)
o(A.dR.prototype,"gih","ii",8)
n(A,"jI",3,null,["$3"],["nj"],2,0)
n(A,"pz",3,null,["$3"],["nk"],2,0)
n(A,"pE",3,null,["$3"],["np"],2,0)
n(A,"pF",3,null,["$3"],["nq"],2,0)
n(A,"pG",3,null,["$3"],["nr"],2,0)
n(A,"pH",3,null,["$3"],["ns"],2,0)
n(A,"pI",3,null,["$3"],["nt"],2,0)
n(A,"pJ",3,null,["$3"],["nu"],2,0)
n(A,"pK",3,null,["$3"],["nv"],2,0)
n(A,"pL",3,null,["$3"],["nw"],2,0)
n(A,"pA",3,null,["$3"],["nl"],2,0)
n(A,"pB",3,null,["$3"],["nm"],2,0)
n(A,"pC",3,null,["$3"],["nn"],2,0)
n(A,"pD",3,null,["$3"],["no"],2,0)
o(m=A.ey.prototype,"gdk","fV",4)
o(m,"gdl","ci",4)
n(A,"pN",6,null,["$6"],["nC"],9,0)
n(A,"pO",6,null,["$6"],["nD"],9,0)
n(A,"pM",6,null,["$6"],["nB"],9,0)})();(function inheritance(){var s=hunkHelpers.mixin,r=hunkHelpers.inherit,q=hunkHelpers.inheritMany
r(A.q,null)
q(A.q,[A.j1,J.dJ,J.c6,A.x,A.cX,A.bd,A.k,A.bp,A.E,A.cg,A.cb,A.X,A.bt,A.ca,A.he,A.fG,A.cd,A.d5,A.V,A.fA,A.bo,A.hP,A.ap,A.eN,A.il,A.eJ,A.bY,A.c_,A.c8,A.eL,A.aM,A.G,A.eK,A.bS,A.es,A.et,A.eS,A.da,A.db,A.eQ,A.by,A.u,A.cZ,A.cG,A.bI,A.ic,A.i9,A.ip,A.bg,A.hQ,A.ea,A.cI,A.hU,A.dz,A.F,A.eT,A.bs,A.iU,A.ii,A.hI,A.fF,A.i6,A.dI,A.fK,A.hH,A.fm,A.dG,A.hG,A.bT,A.ce,A.f6,A.fa,A.fb,A.dv,A.aB,A.dw,A.dx,A.dy,A.d3,A.fi,A.ck,A.bN,A.dr,A.fu,A.am,A.fv,A.bZ,A.dV,A.fx,A.dW,A.cC,A.au,A.bP,A.fO,A.br,A.eh,A.cE,A.h9,A.ew,A.hb,A.ex,A.fC,A.hi,A.cL,A.hj,A.ho,A.hs,A.hu,A.cK,A.ht,A.hk,A.aK,A.cN,A.eG,A.cO,A.cP,A.cM,A.eE,A.hp,A.eF,A.hw,A.cQ,A.dC,A.bL,A.dB,A.cl,A.dE,A.fq,A.Y,A.fH,A.hO,A.ey,A.bG,A.fU,A.cH,A.aY,A.dl,A.aq,A.bw,A.fT,A.hy,A.hB])
q(J.dJ,[J.cr,J.ct,J.al,J.o,J.bl,J.bm,A.cy,A.K])
q(J.al,[J.aV,A.bc,A.aA,A.fd,A.h])
q(J.aV,[J.ec,J.b2,J.aE])
r(J.ft,J.o)
q(J.bl,[J.cs,J.dT])
q(A.x,[A.bn,A.b0,A.dX,A.eB,A.eo,A.c7,A.eM,A.cu,A.e9,A.at,A.eC,A.ez,A.bR,A.ds,A.dt])
r(A.cv,A.cX)
r(A.bU,A.cv)
r(A.be,A.bU)
q(A.bd,[A.dp,A.fh,A.dq,A.ev,A.fz,A.iH,A.iJ,A.hL,A.hK,A.is,A.hY,A.i5,A.fW,A.ih,A.ie,A.hT,A.iO,A.iP,A.h0,A.h3,A.h4,A.h2,A.h5,A.h6,A.h1,A.h8,A.iL,A.f9,A.f8,A.fg,A.fp,A.fw,A.fL,A.iA,A.iB,A.hd,A.f2,A.f3,A.f4,A.f5,A.hC,A.hD])
q(A.dp,[A.iN,A.hM,A.hN,A.im,A.hV,A.i1,A.i_,A.hX,A.i0,A.hW,A.i4,A.i3,A.i2,A.fX,A.ix,A.ig,A.hh,A.hg,A.iz,A.i8,A.hz,A.hF,A.hE])
q(A.k,[A.p,A.aF,A.S,A.cf,A.cq])
q(A.p,[A.T,A.bi,A.an,A.cY])
q(A.T,[A.cJ,A.aG,A.cU])
r(A.bh,A.aF)
q(A.E,[A.cx,A.cS])
r(A.cj,A.ca)
r(A.cB,A.b0)
q(A.ev,[A.er,A.bF])
r(A.eI,A.c7)
r(A.cw,A.V)
r(A.ah,A.cw)
q(A.dq,[A.fy,A.iI,A.it,A.iy,A.hZ,A.fD,A.id,A.ia,A.ij,A.ik,A.hJ,A.h7,A.hv,A.iG,A.iF])
r(A.Q,A.K)
q(A.Q,[A.d_,A.d1])
r(A.d0,A.d_)
r(A.aX,A.d0)
r(A.d2,A.d1)
r(A.ac,A.d2)
q(A.aX,[A.e3,A.e4])
q(A.ac,[A.e5,A.e6,A.e7,A.e8,A.cz,A.cA,A.bq])
r(A.d7,A.eM)
r(A.d6,A.cq)
r(A.bx,A.eL)
r(A.eR,A.da)
r(A.cV,A.ah)
r(A.d4,A.db)
r(A.cW,A.d4)
r(A.bf,A.et)
q(A.bf,[A.eV,A.e_,A.eD])
q(A.bI,[A.du,A.dY])
r(A.dZ,A.cu)
r(A.eP,A.ic)
r(A.eX,A.eP)
r(A.ib,A.eX)
r(A.e0,A.du)
r(A.e1,A.eV)
q(A.at,[A.bQ,A.dF])
q(A.aA,[A.b4,A.aW])
r(A.bJ,A.b4)
r(A.bK,A.bc)
r(A.aH,A.h)
r(A.hR,A.bS)
r(A.cT,A.es)
r(A.eU,A.ii)
r(A.eH,A.hI)
r(A.f_,A.dz)
r(A.dH,A.dI)
r(A.fJ,A.fK)
r(A.ir,A.hH)
q(A.hQ,[A.c9,A.aC,A.dn])
q(A.fa,[A.aT,A.ff,A.dA,A.fo,A.fM,A.fQ,A.h_,A.hc,A.cR])
q(A.fb,[A.dm,A.fe,A.fj,A.fn,A.dU,A.ed,A.fP,A.fZ,A.ha,A.hx])
r(A.fc,A.dm)
r(A.dK,A.aB)
q(A.dK,[A.cm,A.dL,A.dM,A.dN,A.co])
r(A.cn,A.dy)
r(A.dO,A.ck)
r(A.dD,A.aT)
r(A.dP,A.cC)
r(A.dQ,A.fM)
q(A.au,[A.ef,A.eg,A.ei,A.ej,A.el,A.em])
q(A.bP,[A.cF,A.ek])
r(A.dR,A.cM)
r(A.dS,A.cQ)
r(A.cp,A.cR)
r(A.eO,A.hO)
r(A.eb,A.dl)
r(A.bW,A.aY)
r(A.bH,A.bW)
r(A.eu,A.bH)
r(A.aU,A.bG)
s(A.bU,A.bt)
s(A.d_,A.u)
s(A.d0,A.X)
s(A.d1,A.u)
s(A.d2,A.X)
s(A.cX,A.u)
s(A.db,A.cG)
s(A.eX,A.i9)})()
var v={typeUniverse:{eC:new Map(),tR:{},eT:{},tPV:{},sEA:[]},mangledGlobalNames:{e:"int",w:"double",ag:"num",v:"String",B:"bool",F:"Null",j:"List"},mangledNames:{},types:["~(Y)","~()","e(aJ,e,e)","~(@)","B(@)","F()","~(q?,q?)","e(e)","~(e)","~(e,e,e,e,e,b1)","~(am,j<@>)","~(~())","@()","ag(ag,ag)","F(@)","B(v)","~(aH)","~(am,j<e>)","@(@)","e(q?)","j<@>(j<@>)","F(~())","w(e)","e(e,e,e{opacity:w})","G<@>(@)","@(@,@)","e(@,@)","a8<@>(aq)","bT(aq)","B(q?)","F(@,@)","bN(e)","~(@,@)","@(@,v)","~(h)","e(e,e)","F(q,b_)","a8<F>()","v()","v(@)","j<v>(v)","am(e)","aU()","B(e)","@(v)","F(@,b_)","B(q?,q?)","~(e,@)","aJ(e)","e(j<@>)"],interceptorsByTag:null,leafTags:null,arrayRti:Symbol("$ti")}
A.nZ(v.typeUniverse,JSON.parse('{"ec":"aV","b2":"aV","aE":"aV","pP":"h","pS":"h","pV":"b4","pT":"K","cr":{"B":[]},"ct":{"F":[]},"aV":{"ke":[]},"o":{"j":["1"],"p":["1"],"k":["1"]},"ft":{"o":["1"],"j":["1"],"p":["1"],"k":["1"]},"c6":{"E":["1"]},"bl":{"w":[],"ag":[]},"cs":{"w":[],"e":[],"ag":[]},"dT":{"w":[],"ag":[]},"bm":{"v":[]},"bn":{"x":[]},"be":{"u":["e"],"bt":["e"],"j":["e"],"p":["e"],"k":["e"],"u.E":"e","bt.E":"e"},"p":{"k":["1"]},"T":{"p":["1"],"k":["1"]},"cJ":{"T":["1"],"p":["1"],"k":["1"],"k.E":"1","T.E":"1"},"bp":{"E":["1"]},"aF":{"k":["2"],"k.E":"2"},"bh":{"aF":["1","2"],"p":["2"],"k":["2"],"k.E":"2"},"cx":{"E":["2"]},"aG":{"T":["2"],"p":["2"],"k":["2"],"k.E":"2","T.E":"2"},"S":{"k":["1"],"k.E":"1"},"cS":{"E":["1"]},"cf":{"k":["2"],"k.E":"2"},"cg":{"E":["2"]},"bi":{"p":["1"],"k":["1"],"k.E":"1"},"cb":{"E":["1"]},"bU":{"u":["1"],"bt":["1"],"j":["1"],"p":["1"],"k":["1"]},"ca":{"ab":["1","2"]},"cj":{"ca":["1","2"],"ab":["1","2"]},"cB":{"b0":[],"x":[]},"dX":{"x":[]},"eB":{"x":[]},"d5":{"b_":[]},"bd":{"bj":[]},"dp":{"bj":[]},"dq":{"bj":[]},"ev":{"bj":[]},"er":{"bj":[]},"bF":{"bj":[]},"eo":{"x":[]},"eI":{"x":[]},"ah":{"V":["1","2"],"j3":["1","2"],"ab":["1","2"],"V.K":"1","V.V":"2"},"an":{"p":["1"],"k":["1"],"k.E":"1"},"bo":{"E":["1"]},"K":{"R":[]},"Q":{"aa":["1"],"K":[],"R":[]},"aX":{"Q":["w"],"u":["w"],"aa":["w"],"j":["w"],"K":[],"p":["w"],"R":[],"k":["w"],"X":["w"]},"ac":{"Q":["e"],"u":["e"],"aa":["e"],"j":["e"],"K":[],"p":["e"],"R":[],"k":["e"],"X":["e"]},"e3":{"aX":[],"Q":["w"],"u":["w"],"mf":[],"aa":["w"],"j":["w"],"K":[],"p":["w"],"R":[],"k":["w"],"X":["w"],"u.E":"w"},"e4":{"aX":[],"Q":["w"],"u":["w"],"aa":["w"],"j":["w"],"K":[],"p":["w"],"R":[],"k":["w"],"X":["w"],"u.E":"w"},"e5":{"ac":[],"Q":["e"],"u":["e"],"iZ":[],"aa":["e"],"j":["e"],"K":[],"p":["e"],"R":[],"k":["e"],"X":["e"],"u.E":"e"},"e6":{"ac":[],"Q":["e"],"u":["e"],"fs":[],"aa":["e"],"j":["e"],"K":[],"p":["e"],"R":[],"k":["e"],"X":["e"],"u.E":"e"},"e7":{"ac":[],"Q":["e"],"u":["e"],"mp":[],"aa":["e"],"j":["e"],"K":[],"p":["e"],"R":[],"k":["e"],"X":["e"],"u.E":"e"},"e8":{"ac":[],"Q":["e"],"u":["e"],"mQ":[],"aa":["e"],"j":["e"],"K":[],"p":["e"],"R":[],"k":["e"],"X":["e"],"u.E":"e"},"cz":{"ac":[],"Q":["e"],"u":["e"],"aJ":[],"aa":["e"],"j":["e"],"K":[],"p":["e"],"R":[],"k":["e"],"X":["e"],"u.E":"e"},"cA":{"ac":[],"Q":["e"],"u":["e"],"aa":["e"],"j":["e"],"K":[],"p":["e"],"R":[],"k":["e"],"X":["e"],"u.E":"e"},"bq":{"ac":[],"Q":["e"],"u":["e"],"b1":[],"aa":["e"],"j":["e"],"K":[],"p":["e"],"R":[],"k":["e"],"X":["e"],"u.E":"e"},"eM":{"x":[]},"d7":{"b0":[],"x":[]},"G":{"a8":["1"]},"c_":{"E":["1"]},"d6":{"k":["1"],"k.E":"1"},"c8":{"x":[]},"bx":{"eL":["1"]},"da":{"kS":[]},"eR":{"da":[],"kS":[]},"cV":{"ah":["1","2"],"V":["1","2"],"j3":["1","2"],"ab":["1","2"],"V.K":"1","V.V":"2"},"cW":{"cG":["1"],"jc":["1"],"p":["1"],"k":["1"]},"by":{"E":["1"]},"cq":{"k":["1"]},"cv":{"u":["1"],"j":["1"],"p":["1"],"k":["1"]},"cw":{"V":["1","2"],"ab":["1","2"]},"V":{"ab":["1","2"]},"cY":{"p":["2"],"k":["2"],"k.E":"2"},"cZ":{"E":["2"]},"d4":{"cG":["1"],"jc":["1"],"p":["1"],"k":["1"]},"eV":{"bf":["j<e>","v"]},"du":{"bI":["v","j<e>"]},"cu":{"x":[]},"dZ":{"x":[]},"dY":{"bI":["q?","v"]},"e_":{"bf":["q?","v"]},"e0":{"bI":["v","j<e>"]},"e1":{"bf":["j<e>","v"]},"eD":{"bf":["j<e>","v"]},"w":{"ag":[]},"e":{"ag":[]},"j":{"p":["1"],"k":["1"]},"c7":{"x":[]},"b0":{"x":[]},"e9":{"x":[]},"at":{"x":[]},"bQ":{"x":[]},"dF":{"x":[]},"eC":{"x":[]},"ez":{"x":[]},"bR":{"x":[]},"ds":{"x":[]},"ea":{"x":[]},"cI":{"x":[]},"dt":{"x":[]},"cU":{"T":["1"],"p":["1"],"k":["1"],"k.E":"1","T.E":"1"},"eT":{"b_":[]},"bs":{"mO":[]},"aH":{"h":[]},"bJ":{"aA":[]},"bK":{"bc":[]},"aW":{"aA":[]},"b4":{"aA":[]},"hR":{"bS":["1"]},"cT":{"es":["1"]},"dH":{"dI":[]},"bT":{"kR":[]},"cm":{"aB":[]},"dK":{"aB":[]},"cn":{"dy":[]},"dL":{"aB":[]},"dM":{"aB":[]},"dN":{"aB":[]},"co":{"aB":[]},"dO":{"ck":[]},"dD":{"aT":[]},"dP":{"cC":[]},"ef":{"au":[]},"eg":{"au":[]},"ei":{"au":[]},"ej":{"au":[]},"el":{"au":[]},"em":{"au":[]},"cF":{"bP":[]},"ek":{"bP":[]},"dS":{"cQ":[]},"cp":{"cR":[]},"eO":{"nE":[]},"cH":{"aY":[]},"dl":{"kD":[]},"eb":{"kD":[]},"bW":{"aY":[]},"bH":{"aY":[]},"eu":{"bH":[],"aY":[],"kH":[]},"aU":{"bG":[]},"b1":{"j":["e"],"p":["e"],"k":["e"],"R":[]},"iZ":{"j":["e"],"p":["e"],"k":["e"],"R":[]},"fs":{"j":["e"],"p":["e"],"k":["e"],"R":[]},"aJ":{"j":["e"],"p":["e"],"k":["e"],"R":[]}}'))
A.nY(v.typeUniverse,JSON.parse('{"p":1,"bU":1,"Q":1,"et":2,"cq":1,"cv":1,"cw":2,"d4":1,"cX":1,"db":1}'))
var u={c:"EOF reached without finding string terminator",b:"Error handler must accept one Object or one Object and a StackTrace as arguments, and return a value of the returned future's type"}
var t=(function rtii(){var s=A.dg
return{n:s("c8"),G:s("c9"),fK:s("bc"),w:s("aU"),cJ:s("bJ"),gw:s("p<@>"),Q:s("x"),E:s("h"),aX:s("dv"),gV:s("dx"),c8:s("bK"),Y:s("bj"),he:s("kR/(aq)"),c:s("a8<@>"),ct:s("bL"),r:s("cl"),bs:s("dC"),gx:s("bN"),cc:s("dE"),an:s("fs"),bM:s("k<w>"),R:s("k<@>"),hb:s("k<e>"),eB:s("o<dr>"),g9:s("o<dw>"),U:s("o<ck>"),V:s("o<bL>"),dd:s("o<cn>"),W:s("o<j<j<j<e>>>>"),o:s("o<j<j<e>>>"),S:s("o<j<e>>"),a:s("o<q>"),dm:s("o<cC>"),h:s("o<br>"),af:s("o<au>"),cE:s("o<cE>"),s:s("o<v>"),aU:s("o<ex>"),gN:s("o<b1>"),ao:s("o<aK>"),i:s("o<eF>"),J:s("o<cQ>"),e8:s("o<bZ>"),b:s("o<@>"),t:s("o<e>"),f8:s("o<dV?>"),fk:s("o<j<@>?>"),hh:s("o<aJ?>"),bN:s("o<e?>"),bT:s("o<~()>"),A:s("o<~(Y)>"),u:s("ct"),eH:s("ke"),cj:s("aE"),ez:s("aa<@>"),d2:s("am"),d1:s("j<bL>"),f0:s("j<fs>"),h0:s("j<j<j<e>>>"),gS:s("j<j<aK>>"),ew:s("j<q>"),I:s("j<br>"),dl:s("j<cE>"),dy:s("j<v>"),c7:s("j<cK>"),e6:s("j<aK>"),eQ:s("j<cN>"),db:s("j<cO>"),cC:s("j<cP>"),fx:s("j<B>"),j:s("j<@>"),L:s("j<e>"),ge:s("j<aK?>"),q:s("j<d3?>"),cP:s("j<e?>"),bj:s("j<ag>"),ck:s("ab<v,v>"),f:s("ab<@,@>"),dx:s("ab<e,@(aq)>"),e:s("aH"),bK:s("aW"),bZ:s("cy"),d4:s("aX"),bc:s("ac"),dD:s("K"),bm:s("bq"),P:s("F"),K:s("q"),fW:s("br"),fh:s("eh"),g0:s("cF"),hf:s("bP"),bC:s("jc<q>"),l:s("b_"),fN:s("bS<@>"),N:s("v"),cV:s("ew"),gY:s("kH"),bA:s("pY"),eK:s("b0"),ak:s("R"),bv:s("aJ"),D:s("b1"),bI:s("b2"),bD:s("cK"),ai:s("cN"),gT:s("cO"),dE:s("cP"),dN:s("S<v>"),gH:s("aq"),ds:s("bw"),fz:s("bx<@>"),eq:s("G<F>"),d:s("G<@>"),fJ:s("G<e>"),eO:s("d3"),v:s("B"),al:s("B(q)"),bB:s("B(v)"),gR:s("w"),z:s("@"),O:s("@()"),x:s("@(q)"),C:s("@(q,b_)"),eg:s("@(aq)"),g2:s("@(@,@)"),p:s("e"),aw:s("0&*"),_:s("q*"),bG:s("a8<F>?"),aS:s("iZ?"),ha:s("j<q>?"),hc:s("j<b1>?"),bE:s("j<@>?"),T:s("j<e>?"),gZ:s("j<aJ?>?"),k:s("j<e?>?"),eX:s("j<~()>?"),cZ:s("ab<v,v>?"),fF:s("ab<@,@>?"),ec:s("ab<e,~()>?"),c4:s("aW?"),X:s("q?"),dk:s("v?"),aD:s("b1?"),eW:s("cL?"),aj:s("aK?"),dP:s("eG?"),F:s("aM<@,@>?"),g:s("eQ?"),y:s("@(h)?"),B:s("e?"),dA:s("q?(@)?"),Z:s("~()?"),fQ:s("~(aH)?"),bJ:s("~(e)?"),di:s("ag"),H:s("~"),M:s("~()"),m:s("~(am,j<e>)"),aR:s("~(e)")}})();(function constants(){var s=hunkHelpers.makeConstList
B.aE=J.dJ.prototype
B.b=J.o.prototype
B.a=J.cs.prototype
B.c=J.bl.prototype
B.e=J.bm.prototype
B.aF=J.aE.prototype
B.aG=J.al.prototype
B.an=A.aW.prototype
B.q=A.cz.prototype
B.d=A.bq.prototype
B.ao=J.ec.prototype
B.O=J.b2.prototype
B.u=new A.c9("BI_BITFIELDS")
B.v=new A.c9("NONE")
B.P=new A.cb(A.dg("cb<0&>"))
B.Q=function getTagFallback(o) {
  var s = Object.prototype.toString.call(o);
  return s.substring(8, s.length - 1);
}
B.ap=function() {
  var toStringFunction = Object.prototype.toString;
  function getTag(o) {
    var s = toStringFunction.call(o);
    return s.substring(8, s.length - 1);
  }
  function getUnknownTag(object, tag) {
    if (/^HTML[A-Z].*Element$/.test(tag)) {
      var name = toStringFunction.call(object);
      if (name == "[object Object]") return null;
      return "HTMLElement";
    }
  }
  function getUnknownTagGenericBrowser(object, tag) {
    if (self.HTMLElement && object instanceof HTMLElement) return "HTMLElement";
    return getUnknownTag(object, tag);
  }
  function prototypeForTag(tag) {
    if (typeof window == "undefined") return null;
    if (typeof window[tag] == "undefined") return null;
    var constructor = window[tag];
    if (typeof constructor != "function") return null;
    return constructor.prototype;
  }
  function discriminator(tag) { return null; }
  var isBrowser = typeof navigator == "object";
  return {
    getTag: getTag,
    getUnknownTag: isBrowser ? getUnknownTagGenericBrowser : getUnknownTag,
    prototypeForTag: prototypeForTag,
    discriminator: discriminator };
}
B.au=function(getTagFallback) {
  return function(hooks) {
    if (typeof navigator != "object") return hooks;
    var ua = navigator.userAgent;
    if (ua.indexOf("DumpRenderTree") >= 0) return hooks;
    if (ua.indexOf("Chrome") >= 0) {
      function confirm(p) {
        return typeof window == "object" && window[p] && window[p].name == p;
      }
      if (confirm("Window") && confirm("HTMLElement")) return hooks;
    }
    hooks.getTag = getTagFallback;
  };
}
B.aq=function(hooks) {
  if (typeof dartExperimentalFixupGetTag != "function") return hooks;
  hooks.getTag = dartExperimentalFixupGetTag(hooks.getTag);
}
B.ar=function(hooks) {
  var getTag = hooks.getTag;
  var prototypeForTag = hooks.prototypeForTag;
  function getTagFixed(o) {
    var tag = getTag(o);
    if (tag == "Document") {
      if (!!o.xmlVersion) return "!Document";
      return "!HTMLDocument";
    }
    return tag;
  }
  function prototypeForTagFixed(tag) {
    if (tag == "Document") return null;
    return prototypeForTag(tag);
  }
  hooks.getTag = getTagFixed;
  hooks.prototypeForTag = prototypeForTagFixed;
}
B.at=function(hooks) {
  var userAgent = typeof navigator == "object" ? navigator.userAgent : "";
  if (userAgent.indexOf("Firefox") == -1) return hooks;
  var getTag = hooks.getTag;
  var quickMap = {
    "BeforeUnloadEvent": "Event",
    "DataTransfer": "Clipboard",
    "GeoGeolocation": "Geolocation",
    "Location": "!Location",
    "WorkerMessageEvent": "MessageEvent",
    "XMLDocument": "!Document"};
  function getTagFirefox(o) {
    var tag = getTag(o);
    return quickMap[tag] || tag;
  }
  hooks.getTag = getTagFirefox;
}
B.as=function(hooks) {
  var userAgent = typeof navigator == "object" ? navigator.userAgent : "";
  if (userAgent.indexOf("Trident/") == -1) return hooks;
  var getTag = hooks.getTag;
  var quickMap = {
    "BeforeUnloadEvent": "Event",
    "DataTransfer": "Clipboard",
    "HTMLDDElement": "HTMLElement",
    "HTMLDTElement": "HTMLElement",
    "HTMLPhraseElement": "HTMLElement",
    "Position": "Geoposition"
  };
  function getTagIE(o) {
    var tag = getTag(o);
    var newTag = quickMap[tag];
    if (newTag) return newTag;
    if (tag == "Object") {
      if (window.DataView && (o instanceof window.DataView)) return "DataView";
    }
    return tag;
  }
  function prototypeForTagIE(tag) {
    var constructor = window[tag];
    if (constructor == null) return null;
    return constructor.prototype;
  }
  hooks.getTag = getTagIE;
  hooks.prototypeForTag = prototypeForTagIE;
}
B.R=function(hooks) { return hooks; }

B.S=new A.dY()
B.T=new A.e0()
B.av=new A.ea()
B.fS=new A.hG()
B.aw=new A.i6()
B.f=new A.eR()
B.ax=new A.eT()
B.r=new A.ir()
B.G=new A.dn("rgb")
B.i=new A.dn("rgba")
B.ay=new A.aC("argb")
B.az=new A.aC("abgr")
B.U=new A.aC("rgba")
B.aA=new A.aC("bgra")
B.aB=new A.aC("rgb")
B.aC=new A.aC("bgr")
B.aD=new A.aC("luminance")
B.aH=new A.e_(null,null)
B.aI=new A.e1(!1)
B.H=A.b(s([A.pg(),A.pt(),A.pw(),A.pn(),A.pi(),A.ph(),A.pj()]),t.A)
B.w=A.b(s([0,2,8]),t.t)
B.aP=A.b(s([0,4,2,1]),t.t)
B.x=A.b(s([292,260,226,226]),t.t)
B.V=A.b(s([8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8]),t.t)
B.W=A.b(s([137,80,78,71,13,10,26,10]),t.t)
B.X=A.b(s([2,3,7]),t.t)
B.b5=A.b(s([3,3,11]),t.t)
B.Z=A.b(s([511,1023,2047,4095]),t.t)
B.c8=A.b(s([231,120,48,89,115,113,120,152,112]),t.t)
B.eu=A.b(s([152,179,64,126,170,118,46,70,95]),t.t)
B.ev=A.b(s([175,69,143,80,85,82,72,155,103]),t.t)
B.ew=A.b(s([56,58,10,171,218,189,17,13,152]),t.t)
B.eH=A.b(s([114,26,17,163,44,195,21,10,173]),t.t)
B.eS=A.b(s([121,24,80,195,26,62,44,64,85]),t.t)
B.f2=A.b(s([144,71,10,38,171,213,144,34,26]),t.t)
B.fd=A.b(s([170,46,55,19,136,160,33,206,71]),t.t)
B.fo=A.b(s([63,20,8,114,114,208,12,9,226]),t.t)
B.fz=A.b(s([81,40,11,96,182,84,29,16,36]),t.t)
B.dW=A.b(s([B.c8,B.eu,B.ev,B.ew,B.eH,B.eS,B.f2,B.fd,B.fo,B.fz]),t.S)
B.fK=A.b(s([134,183,89,137,98,101,106,165,148]),t.t)
B.fM=A.b(s([72,187,100,130,157,111,32,75,80]),t.t)
B.ex=A.b(s([66,102,167,99,74,62,40,234,128]),t.t)
B.dg=A.b(s([41,53,9,178,241,141,26,8,107]),t.t)
B.ey=A.b(s([74,43,26,146,73,166,49,23,157]),t.t)
B.ez=A.b(s([65,38,105,160,51,52,31,115,128]),t.t)
B.cL=A.b(s([104,79,12,27,217,255,87,17,7]),t.t)
B.eA=A.b(s([87,68,71,44,114,51,15,186,23]),t.t)
B.eB=A.b(s([47,41,14,110,182,183,21,17,194]),t.t)
B.eC=A.b(s([66,45,25,102,197,189,23,18,22]),t.t)
B.bN=A.b(s([B.fK,B.fM,B.ex,B.dg,B.ey,B.ez,B.cL,B.eA,B.eB,B.eC]),t.S)
B.eD=A.b(s([88,88,147,150,42,46,45,196,205]),t.t)
B.eE=A.b(s([43,97,183,117,85,38,35,179,61]),t.t)
B.eF=A.b(s([39,53,200,87,26,21,43,232,171]),t.t)
B.eG=A.b(s([56,34,51,104,114,102,29,93,77]),t.t)
B.eI=A.b(s([39,28,85,171,58,165,90,98,64]),t.t)
B.eJ=A.b(s([34,22,116,206,23,34,43,166,73]),t.t)
B.eK=A.b(s([107,54,32,26,51,1,81,43,31]),t.t)
B.eL=A.b(s([68,25,106,22,64,171,36,225,114]),t.t)
B.eM=A.b(s([34,19,21,102,132,188,16,76,124]),t.t)
B.eN=A.b(s([62,18,78,95,85,57,50,48,51]),t.t)
B.bm=A.b(s([B.eD,B.eE,B.eF,B.eG,B.eI,B.eJ,B.eK,B.eL,B.eM,B.eN]),t.S)
B.eO=A.b(s([193,101,35,159,215,111,89,46,111]),t.t)
B.eP=A.b(s([60,148,31,172,219,228,21,18,111]),t.t)
B.cM=A.b(s([112,113,77,85,179,255,38,120,114]),t.t)
B.dh=A.b(s([40,42,1,196,245,209,10,25,109]),t.t)
B.eQ=A.b(s([88,43,29,140,166,213,37,43,154]),t.t)
B.eR=A.b(s([61,63,30,155,67,45,68,1,209]),t.t)
B.eT=A.b(s([100,80,8,43,154,1,51,26,71]),t.t)
B.di=A.b(s([142,78,78,16,255,128,34,197,171]),t.t)
B.eU=A.b(s([41,40,5,102,211,183,4,1,221]),t.t)
B.eV=A.b(s([51,50,17,168,209,192,23,25,82]),t.t)
B.bL=A.b(s([B.eO,B.eP,B.cM,B.dh,B.eQ,B.eR,B.eT,B.di,B.eU,B.eV]),t.S)
B.dj=A.b(s([138,31,36,171,27,166,38,44,229]),t.t)
B.eW=A.b(s([67,87,58,169,82,115,26,59,179]),t.t)
B.eX=A.b(s([63,59,90,180,59,166,93,73,154]),t.t)
B.eY=A.b(s([40,40,21,116,143,209,34,39,175]),t.t)
B.eZ=A.b(s([47,15,16,183,34,223,49,45,183]),t.t)
B.f_=A.b(s([46,17,33,183,6,98,15,32,183]),t.t)
B.f0=A.b(s([57,46,22,24,128,1,54,17,37]),t.t)
B.f1=A.b(s([65,32,73,115,28,128,23,128,205]),t.t)
B.f3=A.b(s([40,3,9,115,51,192,18,6,223]),t.t)
B.f4=A.b(s([87,37,9,115,59,77,64,21,47]),t.t)
B.e9=A.b(s([B.dj,B.eW,B.eX,B.eY,B.eZ,B.f_,B.f0,B.f1,B.f3,B.f4]),t.S)
B.f5=A.b(s([104,55,44,218,9,54,53,130,226]),t.t)
B.f6=A.b(s([64,90,70,205,40,41,23,26,57]),t.t)
B.f7=A.b(s([54,57,112,184,5,41,38,166,213]),t.t)
B.f8=A.b(s([30,34,26,133,152,116,10,32,134]),t.t)
B.dk=A.b(s([39,19,53,221,26,114,32,73,255]),t.t)
B.f9=A.b(s([31,9,65,234,2,15,1,118,73]),t.t)
B.cN=A.b(s([75,32,12,51,192,255,160,43,51]),t.t)
B.fa=A.b(s([88,31,35,67,102,85,55,186,85]),t.t)
B.fb=A.b(s([56,21,23,111,59,205,45,37,192]),t.t)
B.fc=A.b(s([55,38,70,124,73,102,1,34,98]),t.t)
B.aJ=A.b(s([B.f5,B.f6,B.f7,B.f8,B.dk,B.f9,B.cN,B.fa,B.fb,B.fc]),t.S)
B.fe=A.b(s([125,98,42,88,104,85,117,175,82]),t.t)
B.ff=A.b(s([95,84,53,89,128,100,113,101,45]),t.t)
B.fg=A.b(s([75,79,123,47,51,128,81,171,1]),t.t)
B.fh=A.b(s([57,17,5,71,102,57,53,41,49]),t.t)
B.fi=A.b(s([38,33,13,121,57,73,26,1,85]),t.t)
B.fj=A.b(s([41,10,67,138,77,110,90,47,114]),t.t)
B.cO=A.b(s([115,21,2,10,102,255,166,23,6]),t.t)
B.fk=A.b(s([101,29,16,10,85,128,101,196,26]),t.t)
B.fl=A.b(s([57,18,10,102,102,213,34,20,43]),t.t)
B.fm=A.b(s([117,20,15,36,163,128,68,1,26]),t.t)
B.cn=A.b(s([B.fe,B.ff,B.fg,B.fh,B.fi,B.fj,B.cO,B.fk,B.fl,B.fm]),t.S)
B.d3=A.b(s([102,61,71,37,34,53,31,243,192]),t.t)
B.fn=A.b(s([69,60,71,38,73,119,28,222,37]),t.t)
B.d4=A.b(s([68,45,128,34,1,47,11,245,171]),t.t)
B.fp=A.b(s([62,17,19,70,146,85,55,62,70]),t.t)
B.fq=A.b(s([37,43,37,154,100,163,85,160,1]),t.t)
B.fr=A.b(s([63,9,92,136,28,64,32,201,85]),t.t)
B.cP=A.b(s([75,15,9,9,64,255,184,119,16]),t.t)
B.cQ=A.b(s([86,6,28,5,64,255,25,248,1]),t.t)
B.cR=A.b(s([56,8,17,132,137,255,55,116,128]),t.t)
B.fs=A.b(s([58,15,20,82,135,57,26,121,40]),t.t)
B.b9=A.b(s([B.d3,B.fn,B.d4,B.fp,B.fq,B.fr,B.cP,B.cQ,B.cR,B.fs]),t.S)
B.ft=A.b(s([164,50,31,137,154,133,25,35,218]),t.t)
B.fu=A.b(s([51,103,44,131,131,123,31,6,158]),t.t)
B.fv=A.b(s([86,40,64,135,148,224,45,183,128]),t.t)
B.fw=A.b(s([22,26,17,131,240,154,14,1,209]),t.t)
B.fx=A.b(s([45,16,21,91,64,222,7,1,197]),t.t)
B.fy=A.b(s([56,21,39,155,60,138,23,102,213]),t.t)
B.cS=A.b(s([83,12,13,54,192,255,68,47,28]),t.t)
B.fA=A.b(s([85,26,85,85,128,128,32,146,171]),t.t)
B.fB=A.b(s([18,11,7,63,144,171,4,4,246]),t.t)
B.fC=A.b(s([35,27,10,146,174,171,12,26,128]),t.t)
B.co=A.b(s([B.ft,B.fu,B.fv,B.fw,B.fx,B.fy,B.cS,B.fA,B.fB,B.fC]),t.S)
B.fD=A.b(s([190,80,35,99,180,80,126,54,45]),t.t)
B.fE=A.b(s([85,126,47,87,176,51,41,20,32]),t.t)
B.fF=A.b(s([101,75,128,139,118,146,116,128,85]),t.t)
B.fG=A.b(s([56,41,15,176,236,85,37,9,62]),t.t)
B.cT=A.b(s([71,30,17,119,118,255,17,18,138]),t.t)
B.fH=A.b(s([101,38,60,138,55,70,43,26,142]),t.t)
B.cU=A.b(s([146,36,19,30,171,255,97,27,20]),t.t)
B.fI=A.b(s([138,45,61,62,219,1,81,188,64]),t.t)
B.fJ=A.b(s([32,41,20,117,151,142,20,21,163]),t.t)
B.fL=A.b(s([112,19,12,61,195,128,48,4,24]),t.t)
B.c2=A.b(s([B.fD,B.fE,B.fF,B.fG,B.cT,B.fH,B.cU,B.fI,B.fJ,B.fL]),t.S)
B.a_=A.b(s([B.dW,B.bN,B.bm,B.bL,B.e9,B.aJ,B.cn,B.b9,B.co,B.c2]),t.o)
B.y=A.b(s([3226,6412,200,168,38,38,134,134,100,100,100,100,68,68,68,68]),t.t)
B.bc=A.b(s([8,8,4,2]),t.t)
B.a0=A.b(s([A.pb(),A.pr(),A.pu(),A.pl(),A.pd(),A.pc(),A.pe()]),t.A)
B.J=A.b(s([4,5,6,7,8,9,10,10,11,12,13,14,15,16,17,17,18,19,20,20,21,21,22,22,23,23,24,25,25,26,27,28,29,30,31,32,33,34,35,36,37,37,38,39,40,41,42,43,44,45,46,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,76,77,78,79,80,81,82,83,84,85,86,87,88,89,91,93,95,96,98,100,101,102,104,106,108,110,112,114,116,118,122,124,126,128,130,132,134,136,138,140,143,145,148,151,154,157]),t.t)
B.A=A.b(s([7,6,6,5,5,5,5,4,4,4,4,4,4,4,4,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0]),t.t)
B.z=A.b(s([80,88,23,71,30,30,62,62,4,4,4,4,4,4,4,4,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41]),t.t)
B.a1=A.b(s([24,7,23,25,40,6,39,41,22,26,38,42,56,5,55,57,21,27,54,58,37,43,72,4,71,73,20,28,53,59,70,74,36,44,88,69,75,52,60,3,87,89,19,29,86,90,35,45,68,76,85,91,51,61,104,2,103,105,18,30,102,106,34,46,84,92,67,77,101,107,50,62,120,1,119,121,83,93,17,31,100,108,66,78,118,122,33,47,117,123,49,63,99,109,82,94,0,116,124,65,79,16,32,98,110,48,115,125,81,95,64,114,126,97,111,80,113,127,96,112]),t.t)
B.m=A.b(s([0,1,8,16,9,2,3,10,17,24,32,25,18,11,4,5,12,19,26,33,40,48,41,34,27,20,13,6,7,14,21,28,35,42,49,56,57,50,43,36,29,22,15,23,30,37,44,51,58,59,52,45,38,31,39,46,53,60,61,54,47,55,62,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63]),t.t)
B.K=A.b(s([4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100,102,104,106,108,110,112,114,116,119,122,125,128,131,134,137,140,143,146,149,152,155,158,161,164,167,170,173,177,181,185,189,193,197,201,205,209,213,217,221,225,229,234,239,245,249,254,259,264,269,274,279,284]),t.t)
B.k=A.b(s([0,1996959894,3993919788,2567524794,124634137,1886057615,3915621685,2657392035,249268274,2044508324,3772115230,2547177864,162941995,2125561021,3887607047,2428444049,498536548,1789927666,4089016648,2227061214,450548861,1843258603,4107580753,2211677639,325883990,1684777152,4251122042,2321926636,335633487,1661365465,4195302755,2366115317,997073096,1281953886,3579855332,2724688242,1006888145,1258607687,3524101629,2768942443,901097722,1119000684,3686517206,2898065728,853044451,1172266101,3705015759,2882616665,651767980,1373503546,3369554304,3218104598,565507253,1454621731,3485111705,3099436303,671266974,1594198024,3322730930,2970347812,795835527,1483230225,3244367275,3060149565,1994146192,31158534,2563907772,4023717930,1907459465,112637215,2680153253,3904427059,2013776290,251722036,2517215374,3775830040,2137656763,141376813,2439277719,3865271297,1802195444,476864866,2238001368,4066508878,1812370925,453092731,2181625025,4111451223,1706088902,314042704,2344532202,4240017532,1658658271,366619977,2362670323,4224994405,1303535960,984961486,2747007092,3569037538,1256170817,1037604311,2765210733,3554079995,1131014506,879679996,2909243462,3663771856,1141124467,855842277,2852801631,3708648649,1342533948,654459306,3188396048,3373015174,1466479909,544179635,3110523913,3462522015,1591671054,702138776,2966460450,3352799412,1504918807,783551873,3082640443,3233442989,3988292384,2596254646,62317068,1957810842,3939845945,2647816111,81470997,1943803523,3814918930,2489596804,225274430,2053790376,3826175755,2466906013,167816743,2097651377,4027552580,2265490386,503444072,1762050814,4150417245,2154129355,426522225,1852507879,4275313526,2312317920,282753626,1742555852,4189708143,2394877945,397917763,1622183637,3604390888,2714866558,953729732,1340076626,3518719985,2797360999,1068828381,1219638859,3624741850,2936675148,906185462,1090812512,3747672003,2825379669,829329135,1181335161,3412177804,3160834842,628085408,1382605366,3423369109,3138078467,570562233,1426400815,3317316542,2998733608,733239954,1555261956,3268935591,3050360625,752459403,1541320221,2607071920,3965973030,1969922972,40735498,2617837225,3943577151,1913087877,83908371,2512341634,3803740692,2075208622,213261112,2463272603,3855990285,2094854071,198958881,2262029012,4057260610,1759359992,534414190,2176718541,4139329115,1873836001,414664567,2282248934,4279200368,1711684554,285281116,2405801727,4167216745,1634467795,376229701,2685067896,3608007406,1308918612,956543938,2808555105,3495958263,1231636301,1047427035,2932959818,3654703836,1088359270,936918e3,2847714899,3736837829,1202900863,817233897,3183342108,3401237130,1404277552,615818150,3134207493,3453421203,1423857449,601450431,3009837614,3294710456,1567103746,711928724,3020668471,3272380065,1510334235,755167117]),t.t)
B.t=A.b(s([0,1,3,7,15,31,63,127,255,511,1023,2047,4095,8191,16383,32767,65535,131071,262143,524287,1048575,2097151,4194303,8388607,16777215,33554431,67108863,134217727,268435455,536870911,1073741823,2147483647,4294967295]),t.t)
B.B=A.b(s([0,1,2,3,6,4,5,6,6,6,6,6,6,6,6,7,0]),t.t)
B.a2=A.b(s([null,A.pN(),A.pO(),A.pM()]),A.dg("o<~(e,e,e,e,e,b1)?>"))
B.l=A.b(s([28679,28679,31752,-32759,-31735,-30711,-29687,-28663,29703,29703,30727,30727,-27639,-26615,-25591,-24567]),t.t)
B.h=A.b(s([255,255,255,255,255,255,255,255,255,255,255]),t.t)
B.n=A.b(s([B.h,B.h,B.h]),t.S)
B.dy=A.b(s([176,246,255,255,255,255,255,255,255,255,255]),t.t)
B.c9=A.b(s([223,241,252,255,255,255,255,255,255,255,255]),t.t)
B.dI=A.b(s([249,253,253,255,255,255,255,255,255,255,255]),t.t)
B.bt=A.b(s([B.dy,B.c9,B.dI]),t.S)
B.du=A.b(s([255,244,252,255,255,255,255,255,255,255,255]),t.t)
B.dT=A.b(s([234,254,254,255,255,255,255,255,255,255,255]),t.t)
B.af=A.b(s([253,255,255,255,255,255,255,255,255,255,255]),t.t)
B.cZ=A.b(s([B.du,B.dT,B.af]),t.S)
B.dv=A.b(s([255,246,254,255,255,255,255,255,255,255,255]),t.t)
B.eb=A.b(s([239,253,254,255,255,255,255,255,255,255,255]),t.t)
B.a5=A.b(s([254,255,254,255,255,255,255,255,255,255,255]),t.t)
B.bY=A.b(s([B.dv,B.eb,B.a5]),t.S)
B.ad=A.b(s([255,248,254,255,255,255,255,255,255,255,255]),t.t)
B.ec=A.b(s([251,255,254,255,255,255,255,255,255,255,255]),t.t)
B.fN=A.b(s([B.ad,B.ec,B.h]),t.S)
B.N=A.b(s([255,253,254,255,255,255,255,255,255,255,255]),t.t)
B.dw=A.b(s([251,254,254,255,255,255,255,255,255,255,255]),t.t)
B.bh=A.b(s([B.N,B.dw,B.a5]),t.S)
B.cX=A.b(s([255,254,253,255,254,255,255,255,255,255,255]),t.t)
B.e8=A.b(s([250,255,254,255,254,255,255,255,255,255,255]),t.t)
B.C=A.b(s([254,255,255,255,255,255,255,255,255,255,255]),t.t)
B.b6=A.b(s([B.cX,B.e8,B.C]),t.S)
B.e7=A.b(s([B.n,B.bt,B.cZ,B.bY,B.fN,B.bh,B.b6,B.n]),t.o)
B.bR=A.b(s([217,255,255,255,255,255,255,255,255,255,255]),t.t)
B.ds=A.b(s([225,252,241,253,255,255,254,255,255,255,255]),t.t)
B.e6=A.b(s([234,250,241,250,253,255,253,254,255,255,255]),t.t)
B.bu=A.b(s([B.bR,B.ds,B.e6]),t.S)
B.L=A.b(s([255,254,255,255,255,255,255,255,255,255,255]),t.t)
B.dU=A.b(s([223,254,254,255,255,255,255,255,255,255,255]),t.t)
B.aK=A.b(s([238,253,254,254,255,255,255,255,255,255,255]),t.t)
B.c7=A.b(s([B.L,B.dU,B.aK]),t.S)
B.bv=A.b(s([249,254,255,255,255,255,255,255,255,255,255]),t.t)
B.ea=A.b(s([B.ad,B.bv,B.h]),t.S)
B.dJ=A.b(s([255,253,255,255,255,255,255,255,255,255,255]),t.t)
B.bw=A.b(s([247,254,255,255,255,255,255,255,255,255,255]),t.t)
B.bB=A.b(s([B.dJ,B.bw,B.h]),t.S)
B.bS=A.b(s([252,255,255,255,255,255,255,255,255,255,255]),t.t)
B.dN=A.b(s([B.N,B.bS,B.h]),t.S)
B.ae=A.b(s([255,254,254,255,255,255,255,255,255,255,255]),t.t)
B.dE=A.b(s([B.ae,B.af,B.h]),t.S)
B.bx=A.b(s([255,254,253,255,255,255,255,255,255,255,255]),t.t)
B.a3=A.b(s([250,255,255,255,255,255,255,255,255,255,255]),t.t)
B.aU=A.b(s([B.bx,B.a3,B.C]),t.S)
B.bl=A.b(s([B.bu,B.c7,B.ea,B.bB,B.dN,B.dE,B.aU,B.n]),t.o)
B.ca=A.b(s([186,251,250,255,255,255,255,255,255,255,255]),t.t)
B.aL=A.b(s([234,251,244,254,255,255,255,255,255,255,255]),t.t)
B.bK=A.b(s([251,251,243,253,254,255,254,255,255,255,255]),t.t)
B.e5=A.b(s([B.ca,B.aL,B.bK]),t.S)
B.cb=A.b(s([236,253,254,255,255,255,255,255,255,255,255]),t.t)
B.be=A.b(s([251,253,253,254,254,255,255,255,255,255,255]),t.t)
B.cV=A.b(s([B.N,B.cb,B.be]),t.S)
B.dV=A.b(s([254,254,254,255,255,255,255,255,255,255,255]),t.t)
B.d_=A.b(s([B.ae,B.dV,B.h]),t.S)
B.dz=A.b(s([254,254,255,255,255,255,255,255,255,255,255]),t.t)
B.c0=A.b(s([B.L,B.dz,B.C]),t.S)
B.al=A.b(s([B.h,B.C,B.h]),t.S)
B.c1=A.b(s([B.e5,B.cV,B.d_,B.c0,B.al,B.n,B.n,B.n]),t.o)
B.bT=A.b(s([248,255,255,255,255,255,255,255,255,255,255]),t.t)
B.bg=A.b(s([250,254,252,254,255,255,255,255,255,255,255]),t.t)
B.dA=A.b(s([248,254,249,253,255,255,255,255,255,255,255]),t.t)
B.d2=A.b(s([B.bT,B.bg,B.dA]),t.S)
B.dK=A.b(s([255,253,253,255,255,255,255,255,255,255,255]),t.t)
B.bU=A.b(s([246,253,253,255,255,255,255,255,255,255,255]),t.t)
B.aM=A.b(s([252,254,251,254,254,255,255,255,255,255,255]),t.t)
B.aN=A.b(s([B.dK,B.bU,B.aM]),t.S)
B.dx=A.b(s([255,254,252,255,255,255,255,255,255,255,255]),t.t)
B.dB=A.b(s([248,254,253,255,255,255,255,255,255,255,255]),t.t)
B.dt=A.b(s([253,255,254,254,255,255,255,255,255,255,255]),t.t)
B.bj=A.b(s([B.dx,B.dB,B.dt]),t.S)
B.ed=A.b(s([255,251,254,255,255,255,255,255,255,255,255]),t.t)
B.ee=A.b(s([245,251,254,255,255,255,255,255,255,255,255]),t.t)
B.ef=A.b(s([253,253,254,255,255,255,255,255,255,255,255]),t.t)
B.dX=A.b(s([B.ed,B.ee,B.ef]),t.S)
B.dL=A.b(s([255,251,253,255,255,255,255,255,255,255,255]),t.t)
B.cc=A.b(s([252,253,254,255,255,255,255,255,255,255,255]),t.t)
B.dZ=A.b(s([B.dL,B.cc,B.L]),t.S)
B.by=A.b(s([255,252,255,255,255,255,255,255,255,255,255]),t.t)
B.eg=A.b(s([249,255,254,255,255,255,255,255,255,255,255]),t.t)
B.eh=A.b(s([255,255,254,255,255,255,255,255,255,255,255]),t.t)
B.b7=A.b(s([B.by,B.eg,B.eh]),t.S)
B.dM=A.b(s([255,255,253,255,255,255,255,255,255,255,255]),t.t)
B.fO=A.b(s([B.dM,B.a3,B.h]),t.S)
B.ba=A.b(s([B.d2,B.aN,B.bj,B.dX,B.dZ,B.b7,B.fO,B.al]),t.o)
B.bO=A.b(s([B.e7,B.bl,B.c1,B.ba]),t.W)
B.a4=A.b(s([0,1,3,7,15,31,63,127,255,511,1023,2047,4095]),t.t)
B.I=A.b(s([128,128,128,128,128,128,128,128,128,128,128]),t.t)
B.aa=A.b(s([B.I,B.I,B.I]),t.S)
B.cy=A.b(s([253,136,254,255,228,219,128,128,128,128,128]),t.t)
B.cp=A.b(s([189,129,242,255,227,213,255,219,128,128,128]),t.t)
B.eq=A.b(s([106,126,227,252,214,209,255,255,128,128,128]),t.t)
B.ep=A.b(s([B.cy,B.cp,B.eq]),t.S)
B.bD=A.b(s([1,98,248,255,236,226,255,255,128,128,128]),t.t)
B.cE=A.b(s([181,133,238,254,221,234,255,154,128,128,128]),t.t)
B.cq=A.b(s([78,134,202,247,198,180,255,219,128,128,128]),t.t)
B.d7=A.b(s([B.bD,B.cE,B.cq]),t.S)
B.bP=A.b(s([1,185,249,255,243,255,128,128,128,128,128]),t.t)
B.d8=A.b(s([184,150,247,255,236,224,128,128,128,128,128]),t.t)
B.bo=A.b(s([77,110,216,255,236,230,128,128,128,128,128]),t.t)
B.cg=A.b(s([B.bP,B.d8,B.bo]),t.S)
B.bQ=A.b(s([1,101,251,255,241,255,128,128,128,128,128]),t.t)
B.ei=A.b(s([170,139,241,252,236,209,255,255,128,128,128]),t.t)
B.ck=A.b(s([37,116,196,243,228,255,255,255,128,128,128]),t.t)
B.bz=A.b(s([B.bQ,B.ei,B.ck]),t.S)
B.aT=A.b(s([1,204,254,255,245,255,128,128,128,128,128]),t.t)
B.bp=A.b(s([207,160,250,255,238,128,128,128,128,128,128]),t.t)
B.d9=A.b(s([102,103,231,255,211,171,128,128,128,128,128]),t.t)
B.b8=A.b(s([B.aT,B.bp,B.d9]),t.S)
B.e1=A.b(s([1,152,252,255,240,255,128,128,128,128,128]),t.t)
B.da=A.b(s([177,135,243,255,234,225,128,128,128,128,128]),t.t)
B.bq=A.b(s([80,129,211,255,194,224,128,128,128,128,128]),t.t)
B.bb=A.b(s([B.e1,B.da,B.bq]),t.S)
B.Y=A.b(s([1,1,255,128,128,128,128,128,128,128,128]),t.t)
B.aX=A.b(s([246,1,255,128,128,128,128,128,128,128,128]),t.t)
B.aQ=A.b(s([255,128,128,128,128,128,128,128,128,128,128]),t.t)
B.c6=A.b(s([B.Y,B.aX,B.aQ]),t.S)
B.aV=A.b(s([B.aa,B.ep,B.d7,B.cg,B.bz,B.b8,B.bb,B.c6]),t.o)
B.aY=A.b(s([198,35,237,223,193,187,162,160,145,155,62]),t.t)
B.aW=A.b(s([131,45,198,221,172,176,220,157,252,221,1]),t.t)
B.dc=A.b(s([68,47,146,208,149,167,221,162,255,223,128]),t.t)
B.bi=A.b(s([B.aY,B.aW,B.dc]),t.S)
B.dO=A.b(s([1,149,241,255,221,224,255,255,128,128,128]),t.t)
B.cr=A.b(s([184,141,234,253,222,220,255,199,128,128,128]),t.t)
B.dl=A.b(s([81,99,181,242,176,190,249,202,255,255,128]),t.t)
B.bA=A.b(s([B.dO,B.cr,B.dl]),t.S)
B.dF=A.b(s([1,129,232,253,214,197,242,196,255,255,128]),t.t)
B.cF=A.b(s([99,121,210,250,201,198,255,202,128,128,128]),t.t)
B.dm=A.b(s([23,91,163,242,170,187,247,210,255,255,128]),t.t)
B.fP=A.b(s([B.dF,B.cF,B.dm]),t.S)
B.e2=A.b(s([1,200,246,255,234,255,128,128,128,128,128]),t.t)
B.cl=A.b(s([109,178,241,255,231,245,255,255,128,128,128]),t.t)
B.bE=A.b(s([44,130,201,253,205,192,255,255,128,128,128]),t.t)
B.c_=A.b(s([B.e2,B.cl,B.bE]),t.S)
B.dC=A.b(s([1,132,239,251,219,209,255,165,128,128,128]),t.t)
B.bF=A.b(s([94,136,225,251,218,190,255,255,128,128,128]),t.t)
B.cs=A.b(s([22,100,174,245,186,161,255,199,128,128,128]),t.t)
B.d6=A.b(s([B.dC,B.bF,B.cs]),t.S)
B.el=A.b(s([1,182,249,255,232,235,128,128,128,128,128]),t.t)
B.db=A.b(s([124,143,241,255,227,234,128,128,128,128,128]),t.t)
B.ct=A.b(s([35,77,181,251,193,211,255,205,128,128,128]),t.t)
B.dS=A.b(s([B.el,B.db,B.ct]),t.S)
B.cf=A.b(s([1,157,247,255,236,231,255,255,128,128,128]),t.t)
B.dP=A.b(s([121,141,235,255,225,227,255,255,128,128,128]),t.t)
B.cu=A.b(s([45,99,188,251,195,217,255,224,128,128,128]),t.t)
B.bf=A.b(s([B.cf,B.dP,B.cu]),t.S)
B.em=A.b(s([1,1,251,255,213,255,128,128,128,128,128]),t.t)
B.cz=A.b(s([203,1,248,255,255,128,128,128,128,128,128]),t.t)
B.e3=A.b(s([137,1,177,255,224,255,128,128,128,128,128]),t.t)
B.cd=A.b(s([B.em,B.cz,B.e3]),t.S)
B.bC=A.b(s([B.bi,B.bA,B.fP,B.c_,B.d6,B.dS,B.bf,B.cd]),t.o)
B.dH=A.b(s([253,9,248,251,207,208,255,192,128,128,128]),t.t)
B.d0=A.b(s([175,13,224,243,193,185,249,198,255,255,128]),t.t)
B.dd=A.b(s([73,17,171,221,161,179,236,167,255,234,128]),t.t)
B.aO=A.b(s([B.dH,B.d0,B.dd]),t.S)
B.dQ=A.b(s([1,95,247,253,212,183,255,255,128,128,128]),t.t)
B.dR=A.b(s([239,90,244,250,211,209,255,255,128,128,128]),t.t)
B.er=A.b(s([155,77,195,248,188,195,255,255,128,128,128]),t.t)
B.c3=A.b(s([B.dQ,B.dR,B.er]),t.S)
B.dD=A.b(s([1,24,239,251,218,219,255,205,128,128,128]),t.t)
B.br=A.b(s([201,51,219,255,196,186,128,128,128,128,128]),t.t)
B.cv=A.b(s([69,46,190,239,201,218,255,228,128,128,128]),t.t)
B.d1=A.b(s([B.dD,B.br,B.cv]),t.S)
B.bd=A.b(s([1,191,251,255,255,128,128,128,128,128,128]),t.t)
B.en=A.b(s([223,165,249,255,213,255,128,128,128,128,128]),t.t)
B.cA=A.b(s([141,124,248,255,255,128,128,128,128,128,128]),t.t)
B.bn=A.b(s([B.bd,B.en,B.cA]),t.S)
B.cB=A.b(s([1,16,248,255,255,128,128,128,128,128,128]),t.t)
B.e4=A.b(s([190,36,230,255,236,255,128,128,128,128,128]),t.t)
B.aZ=A.b(s([149,1,255,128,128,128,128,128,128,128,128]),t.t)
B.ch=A.b(s([B.cB,B.e4,B.aZ]),t.S)
B.b_=A.b(s([1,226,255,128,128,128,128,128,128,128,128]),t.t)
B.bM=A.b(s([247,192,255,128,128,128,128,128,128,128,128]),t.t)
B.b0=A.b(s([240,128,255,128,128,128,128,128,128,128,128]),t.t)
B.ej=A.b(s([B.b_,B.bM,B.b0]),t.S)
B.cC=A.b(s([1,134,252,255,255,128,128,128,128,128,128]),t.t)
B.cD=A.b(s([213,62,250,255,255,128,128,128,128,128,128]),t.t)
B.b1=A.b(s([55,93,255,128,128,128,128,128,128,128,128]),t.t)
B.bW=A.b(s([B.cC,B.cD,B.b1]),t.S)
B.bV=A.b(s([B.aO,B.c3,B.d1,B.bn,B.ch,B.ej,B.bW,B.aa]),t.o)
B.cm=A.b(s([202,24,213,235,186,191,220,160,240,175,255]),t.t)
B.de=A.b(s([126,38,182,232,169,184,228,174,255,187,128]),t.t)
B.df=A.b(s([61,46,138,219,151,178,240,170,255,216,128]),t.t)
B.ek=A.b(s([B.cm,B.de,B.df]),t.S)
B.dn=A.b(s([1,112,230,250,199,191,247,159,255,255,128]),t.t)
B.cG=A.b(s([166,109,228,252,211,215,255,174,128,128,128]),t.t)
B.dp=A.b(s([39,77,162,232,172,180,245,178,255,255,128]),t.t)
B.ce=A.b(s([B.dn,B.cG,B.dp]),t.S)
B.dq=A.b(s([1,52,220,246,198,199,249,220,255,255,128]),t.t)
B.dG=A.b(s([124,74,191,243,183,193,250,221,255,255,128]),t.t)
B.dr=A.b(s([24,71,130,219,154,170,243,182,255,255,128]),t.t)
B.d5=A.b(s([B.dq,B.dG,B.dr]),t.S)
B.cw=A.b(s([1,182,225,249,219,240,255,224,128,128,128]),t.t)
B.cH=A.b(s([149,150,226,252,216,205,255,171,128,128,128]),t.t)
B.cj=A.b(s([28,108,170,242,183,194,254,223,255,255,128]),t.t)
B.bX=A.b(s([B.cw,B.cH,B.cj]),t.S)
B.cI=A.b(s([1,81,230,252,204,203,255,192,128,128,128]),t.t)
B.bG=A.b(s([123,102,209,247,188,196,255,233,128,128,128]),t.t)
B.cx=A.b(s([20,95,153,243,164,173,255,203,128,128,128]),t.t)
B.bk=A.b(s([B.cI,B.bG,B.cx]),t.S)
B.bs=A.b(s([1,222,248,255,216,213,128,128,128,128,128]),t.t)
B.bJ=A.b(s([168,175,246,252,235,205,255,255,128,128,128]),t.t)
B.bH=A.b(s([47,116,215,255,211,212,255,255,128,128,128]),t.t)
B.c5=A.b(s([B.bs,B.bJ,B.bH]),t.S)
B.bI=A.b(s([1,121,236,253,212,214,255,255,128,128,128]),t.t)
B.cJ=A.b(s([141,84,213,252,201,202,255,219,128,128,128]),t.t)
B.cK=A.b(s([42,80,160,240,162,185,255,205,128,128,128]),t.t)
B.eo=A.b(s([B.bI,B.cJ,B.cK]),t.S)
B.b2=A.b(s([244,1,255,128,128,128,128,128,128,128,128]),t.t)
B.b3=A.b(s([238,1,255,128,128,128,128,128,128,128,128]),t.t)
B.bZ=A.b(s([B.Y,B.b2,B.b3]),t.S)
B.dY=A.b(s([B.ek,B.ce,B.d5,B.bX,B.bk,B.c5,B.eo,B.bZ]),t.o)
B.c4=A.b(s([B.aV,B.bC,B.bV,B.dY]),t.W)
B.D=A.b(s([6430,6400,6400,6400,3225,3225,3225,3225,944,944,944,944,976,976,976,976,1456,1456,1456,1456,1488,1488,1488,1488,718,718,718,718,718,718,718,718,750,750,750,750,750,750,750,750,1520,1520,1520,1520,1552,1552,1552,1552,428,428,428,428,428,428,428,428,428,428,428,428,428,428,428,428,654,654,654,654,654,654,654,654,1072,1072,1072,1072,1104,1104,1104,1104,1136,1136,1136,1136,1168,1168,1168,1168,1200,1200,1200,1200,1232,1232,1232,1232,622,622,622,622,622,622,622,622,1008,1008,1008,1008,1040,1040,1040,1040,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,396,396,396,396,396,396,396,396,396,396,396,396,396,396,396,396,1712,1712,1712,1712,1744,1744,1744,1744,846,846,846,846,846,846,846,846,1264,1264,1264,1264,1296,1296,1296,1296,1328,1328,1328,1328,1360,1360,1360,1360,1392,1392,1392,1392,1424,1424,1424,1424,686,686,686,686,686,686,686,686,910,910,910,910,910,910,910,910,1968,1968,1968,1968,2000,2000,2000,2000,2032,2032,2032,2032,16,16,16,16,10257,10257,10257,10257,12305,12305,12305,12305,330,330,330,330,330,330,330,330,330,330,330,330,330,330,330,330,330,330,330,330,330,330,330,330,330,330,330,330,330,330,330,330,362,362,362,362,362,362,362,362,362,362,362,362,362,362,362,362,362,362,362,362,362,362,362,362,362,362,362,362,362,362,362,362,878,878,878,878,878,878,878,878,1904,1904,1904,1904,1936,1936,1936,1936,-18413,-18413,-16365,-16365,-14317,-14317,-10221,-10221,590,590,590,590,590,590,590,590,782,782,782,782,782,782,782,782,1584,1584,1584,1584,1616,1616,1616,1616,1648,1648,1648,1648,1680,1680,1680,1680,814,814,814,814,814,814,814,814,1776,1776,1776,1776,1808,1808,1808,1808,1840,1840,1840,1840,1872,1872,1872,1872,6157,6157,6157,6157,6157,6157,6157,6157,6157,6157,6157,6157,6157,6157,6157,6157,-12275,-12275,-12275,-12275,-12275,-12275,-12275,-12275,-12275,-12275,-12275,-12275,-12275,-12275,-12275,-12275,14353,14353,14353,14353,16401,16401,16401,16401,22547,22547,24595,24595,20497,20497,20497,20497,18449,18449,18449,18449,26643,26643,28691,28691,30739,30739,-32749,-32749,-30701,-30701,-28653,-28653,-26605,-26605,-24557,-24557,-22509,-22509,-20461,-20461,8207,8207,8207,8207,8207,8207,8207,8207,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,4107,266,266,266,266,266,266,266,266,266,266,266,266,266,266,266,266,266,266,266,266,266,266,266,266,266,266,266,266,266,266,266,266,298,298,298,298,298,298,298,298,298,298,298,298,298,298,298,298,298,298,298,298,298,298,298,298,298,298,298,298,298,298,298,298,524,524,524,524,524,524,524,524,524,524,524,524,524,524,524,524,556,556,556,556,556,556,556,556,556,556,556,556,556,556,556,556,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,460,460,460,460,460,460,460,460,460,460,460,460,460,460,460,460,492,492,492,492,492,492,492,492,492,492,492,492,492,492,492,492,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,2059,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232,232]),t.t)
B.o=A.b(s([0,-128,64,-64,32,-96,96,-32,16,-112,80,-48,48,-80,112,-16,8,-120,72,-56,40,-88,104,-24,24,-104,88,-40,56,-72,120,-8,4,-124,68,-60,36,-92,100,-28,20,-108,84,-44,52,-76,116,-12,12,-116,76,-52,44,-84,108,-20,28,-100,92,-36,60,-68,124,-4,2,-126,66,-62,34,-94,98,-30,18,-110,82,-46,50,-78,114,-14,10,-118,74,-54,42,-86,106,-22,26,-102,90,-38,58,-70,122,-6,6,-122,70,-58,38,-90,102,-26,22,-106,86,-42,54,-74,118,-10,14,-114,78,-50,46,-82,110,-18,30,-98,94,-34,62,-66,126,-2,1,-127,65,-63,33,-95,97,-31,17,-111,81,-47,49,-79,113,-15,9,-119,73,-55,41,-87,105,-23,25,-103,89,-39,57,-71,121,-7,5,-123,69,-59,37,-91,101,-27,21,-107,85,-43,53,-75,117,-11,13,-115,77,-51,45,-83,109,-19,29,-99,93,-35,61,-67,125,-3,3,-125,67,-61,35,-93,99,-29,19,-109,83,-45,51,-77,115,-13,11,-117,75,-53,43,-85,107,-21,27,-101,91,-37,59,-69,123,-5,7,-121,71,-57,39,-89,103,-25,23,-105,87,-41,55,-73,119,-9,15,-113,79,-49,47,-81,111,-17,31,-97,95,-33,63,-65,127,-1]),t.t)
B.ci=A.b(s([0,0,0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13]),t.t)
B.a6=A.b(s([5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5]),t.t)
B.E=A.b(s([-0.0,1,-1,2,-2,3,4,6,-3,5,-4,-5,-6,7,-7,8,-8,-9]),t.t)
B.a8=A.b(s([0,1,4,8,5,2,3,6,9,12,13,10,7,11,14,15]),t.t)
B.a7=A.b(s([0,4,8,12,128,132,136,140,256,260,264,268,384,388,392,396]),t.t)
B.M=A.b(s([0,8,4,12,2,10,6,14,1,9,5,13,3,11,7,15]),t.t)
B.cW=A.b(s([0,0,0,0,0,0,0,0,1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,0,0,0]),t.t)
B.cY=A.b(s([]),t.s)
B.a9=A.b(s([]),t.b)
B.ab=A.b(s([1,2,3,4,5,7,9,13,17,25,33,49,65,97,129,193,257,385,513,769,1025,1537,2049,3073,4097,6145,8193,12289,16385,24577]),t.t)
B.j=A.b(s([0,1,3,7,15,31,63,127,255]),t.t)
B.p=A.b(s([0,128,192,224,240,248,252,254,255]),t.t)
B.ac=A.b(s([0,1,1,2,4,8,1,1,2,4,8,4,8]),t.t)
B.F=A.b(s([62,62,30,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,3225,588,588,588,588,588,588,588,588,1680,1680,20499,22547,24595,26643,1776,1776,1808,1808,-24557,-22509,-20461,-18413,1904,1904,1936,1936,-16365,-14317,782,782,782,782,814,814,814,814,-12269,-10221,10257,10257,12305,12305,14353,14353,16403,18451,1712,1712,1744,1744,28691,30739,-32749,-30701,-28653,-26605,2061,2061,2061,2061,2061,2061,2061,2061,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,750,750,750,750,1616,1616,1648,1648,1424,1424,1456,1456,1488,1488,1520,1520,1840,1840,1872,1872,1968,1968,8209,8209,524,524,524,524,524,524,524,524,556,556,556,556,556,556,556,556,1552,1552,1584,1584,2000,2000,2032,2032,976,976,1008,1008,1040,1040,1072,1072,1296,1296,1328,1328,718,718,718,718,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,358,490,490,490,490,490,490,490,490,490,490,490,490,490,490,490,490,4113,4113,6161,6161,848,848,880,880,912,912,944,944,622,622,622,622,654,654,654,654,1104,1104,1136,1136,1168,1168,1200,1200,1232,1232,1264,1264,686,686,686,686,1360,1360,1392,1392,12,12,12,12,12,12,12,12,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390,390]),t.t)
B.ag=A.b(s([3,4,5,6,7,8,9,10,11,13,15,17,19,23,27,31,35,43,51,59,67,83,99,115,131,163,195,227,258]),t.t)
B.aR=A.b(s([173,148,140]),t.t)
B.aS=A.b(s([176,155,140,135]),t.t)
B.et=A.b(s([180,157,141,134,130]),t.t)
B.b4=A.b(s([254,254,243,230,196,177,153,140,133,130,129]),t.t)
B.ah=A.b(s([B.aR,B.aS,B.et,B.b4]),t.S)
B.ai=A.b(s([A.pf(),A.ps(),A.pv(),A.pm(),A.pq(),A.py(),A.pp(),A.px(),A.pk(),A.po()]),t.A)
B.e_=A.b(s([16,17,18,0,8,7,9,6,10,5,11,4,12,3,13,2,14,1,15]),t.t)
B.e0=A.b(s([17,18,0,1,2,3,4,5,16,6,7,8,9,10,11,12,13,14,15]),t.t)
B.aj=A.b(s([127,127,191,127,159,191,223,127,143,159,175,191,207,223,239,127,135,143,151,159,167,175,183,191,199,207,215,223,231,239,247,127,131,135,139,143,147,151,155,159,163,167,171,175,179,183,187,191,195,199,203,207,211,215,219,223,227,231,235,239,243,247,251,127,129,131,133,135,137,139,141,143,145,147,149,151,153,155,157,159,161,163,165,167,169,171,173,175,177,179,181,183,185,187,189,191,193,195,197,199,201,203,205,207,209,211,213,215,217,219,221,223,225,227,229,231,233,235,237,239,241,243,245,247,249,251,253,127]),t.t)
B.es=A.b(s([280,256,256,256,40]),t.t)
B.ak=A.b(s([0,1,1,2,4,8,1,1,2,4,8,4,8,0]),t.t)
B.am=new A.cj([315,"artist",258,"bitsPerSample",265,"cellLength",264,"cellWidth",320,"colorMap",259,"compression",306,"dateTime",34665,"exifIFD",338,"extraSamples",266,"fillOrder",289,"freeByteCounts",288,"freeOffsets",291,"grayResponseCurve",290,"grayResponseUnit",316,"hostComputer",34675,"iccProfile",270,"imageDescription",257,"imageLength",256,"imageWidth",33723,"iptc",271,"make",281,"maxSampleValue",280,"minSampleValue",272,"model",254,"newSubfileType",274,"orientation",262,"photometricInterpretation",34377,"photoshop",284,"planarConfiguration",317,"predictor",296,"resolutionUnit",278,"rowsPerStrip",277,"samplesPerPixel",305,"software",279,"stripByteCounts",273,"stropOffsets",255,"subfileType",292,"t4Options",293,"t6Options",263,"thresholding",322,"tileWidth",323,"tileLength",324,"tileOffsets",325,"tileByteCounts",700,"xmp",282,"xResolution",283,"yResolution",529,"yCbCrCoefficients",530,"yCbCrSubsampling",531,"yCbCrPositioning",339,"sampleFormat"],A.dg("cj<e,v>"))
B.fQ=new A.eD(!0)
B.fR=new A.bY(null,2)})();(function staticFields(){$.i7=null
$.kq=null
$.jX=null
$.jW=null
$.lk=null
$.ld=null
$.lp=null
$.iD=null
$.iK=null
$.jF=null
$.c1=null
$.dd=null
$.de=null
$.jA=!1
$.A=B.f
$.ae=A.b([],t.a)
$.jy=null
$.kM=!1
$.kN=A.b([A.jI(),A.pz(),A.pE(),A.pF(),A.pG(),A.pH(),A.pI(),A.pJ(),A.pK(),A.pL(),A.pA(),A.pB(),A.pC(),A.pD(),A.jI(),A.jI()],A.dg("o<e(aJ,e,e)>"))
$.iY=null
$.L=null
$.fk=A.ar("_eLut")
$.Z=null
$.aZ=!1})();(function lazyInitializers(){var s=hunkHelpers.lazyFinal,r=hunkHelpers.lazy
s($,"pR","lu",()=>A.oS("_$dart_dartClosure"))
s($,"qF","jO",()=>B.f.e4(new A.iN(),A.dg("a8<F>")))
s($,"pZ","lw",()=>A.aI(A.hf({
toString:function(){return"$receiver$"}})))
s($,"q_","lx",()=>A.aI(A.hf({$method$:null,
toString:function(){return"$receiver$"}})))
s($,"q0","ly",()=>A.aI(A.hf(null)))
s($,"q1","lz",()=>A.aI(function(){var $argumentsExpr$="$arguments$"
try{null.$method$($argumentsExpr$)}catch(q){return q.message}}()))
s($,"q4","lC",()=>A.aI(A.hf(void 0)))
s($,"q5","lD",()=>A.aI(function(){var $argumentsExpr$="$arguments$"
try{(void 0).$method$($argumentsExpr$)}catch(q){return q.message}}()))
s($,"q3","lB",()=>A.aI(A.kI(null)))
s($,"q2","lA",()=>A.aI(function(){try{null.$method$}catch(q){return q.message}}()))
s($,"q7","lF",()=>A.aI(A.kI(void 0)))
s($,"q6","lE",()=>A.aI(function(){try{(void 0).$method$}catch(q){return q.message}}()))
s($,"qg","jK",()=>A.nF())
s($,"q8","lG",()=>new A.hh().$0())
s($,"q9","lH",()=>new A.hg().$0())
r($,"qD","lM",()=>new Error().stack!=void 0)
r($,"qa","eY",()=>A.fE(511))
r($,"qb","iQ",()=>A.fE(511))
r($,"qd","iR",()=>A.kn(2041))
r($,"qe","eZ",()=>A.kn(225))
r($,"qc","a6",()=>A.fE(766))
s($,"qt","W",()=>A.fE(1))
s($,"qu","a3",()=>{var q=$.W().buffer
A.bz(q,0,null)
q=new Int8Array(q,0)
return q})
s($,"qm","a2",()=>A.mA(1))
s($,"qn","a7",()=>{var q,p=$.a2().buffer
A.bz(p,0,null)
q=B.a.F(p.byteLength-0,2)
return new Int16Array(p,0,q)})
s($,"qo","z",()=>A.mB(1))
s($,"qq","M",()=>{var q,p=$.z().buffer
A.bz(p,0,null)
q=B.a.F(p.byteLength-0,4)
return new Int32Array(p,0,q)})
s($,"qp","bb",()=>A.mg($.z().buffer))
s($,"qk","jM",()=>A.mz(1))
s($,"ql","lK",()=>A.kJ($.jM().buffer,0))
s($,"qi","jL",()=>A.mx(1))
s($,"qj","lJ",()=>A.kJ($.jL().buffer,0))
s($,"qr","jN",()=>A.mR(1))
s($,"qs","lL",()=>{var q=$.jN()
return A.mh(q.gcq(q))})
s($,"pX","lv",()=>new A.ey())
s($,"qf","lI",()=>new A.bw(!0,null,null,null))
s($,"pQ","lt",()=>{var q=new A.aU(!1,++$.jJ().a,null)
q.f=1
q.a=0
return q})
s($,"pU","jJ",()=>new A.fT())})();(function nativeSupport(){!function(){var s=function(a){var m={}
m[a]=1
return Object.keys(hunkHelpers.convertToFastObject(m))[0]}
v.getIsolateTag=function(a){return s("___dart_"+a+v.isolateTag)}
var r="___dart_isolate_tags_"
var q=Object[r]||(Object[r]=Object.create(null))
var p="_ZxYxX"
for(var o=0;;o++){var n=s(p+"_"+o+"_")
if(!(n in q)){q[n]=1
v.isolateTag=n
break}}v.dispatchPropertyName=v.getIsolateTag("dispatch_record")}()
hunkHelpers.setOrUpdateInterceptorsByTag({DOMError:J.al,MediaError:J.al,MessageChannel:J.al,NavigatorUserMediaError:J.al,OverconstrainedError:J.al,PositionError:J.al,GeolocationPositionError:J.al,ArrayBuffer:A.cy,DataView:A.K,ArrayBufferView:A.K,Float32Array:A.e3,Float64Array:A.e4,Int16Array:A.e5,Int32Array:A.e6,Int8Array:A.e7,Uint16Array:A.e8,Uint32Array:A.cz,Uint8ClampedArray:A.cA,CanvasPixelArray:A.cA,Uint8Array:A.bq,Blob:A.bc,DedicatedWorkerGlobalScope:A.bJ,DOMException:A.fd,AbortPaymentEvent:A.h,AnimationEvent:A.h,AnimationPlaybackEvent:A.h,ApplicationCacheErrorEvent:A.h,BackgroundFetchClickEvent:A.h,BackgroundFetchEvent:A.h,BackgroundFetchFailEvent:A.h,BackgroundFetchedEvent:A.h,BeforeInstallPromptEvent:A.h,BeforeUnloadEvent:A.h,BlobEvent:A.h,CanMakePaymentEvent:A.h,ClipboardEvent:A.h,CloseEvent:A.h,CompositionEvent:A.h,CustomEvent:A.h,DeviceMotionEvent:A.h,DeviceOrientationEvent:A.h,ErrorEvent:A.h,ExtendableEvent:A.h,ExtendableMessageEvent:A.h,FetchEvent:A.h,FocusEvent:A.h,FontFaceSetLoadEvent:A.h,ForeignFetchEvent:A.h,GamepadEvent:A.h,HashChangeEvent:A.h,InstallEvent:A.h,KeyboardEvent:A.h,MediaEncryptedEvent:A.h,MediaKeyMessageEvent:A.h,MediaQueryListEvent:A.h,MediaStreamEvent:A.h,MediaStreamTrackEvent:A.h,MIDIConnectionEvent:A.h,MIDIMessageEvent:A.h,MouseEvent:A.h,DragEvent:A.h,MutationEvent:A.h,NotificationEvent:A.h,PageTransitionEvent:A.h,PaymentRequestEvent:A.h,PaymentRequestUpdateEvent:A.h,PointerEvent:A.h,PopStateEvent:A.h,PresentationConnectionAvailableEvent:A.h,PresentationConnectionCloseEvent:A.h,ProgressEvent:A.h,PromiseRejectionEvent:A.h,PushEvent:A.h,RTCDataChannelEvent:A.h,RTCDTMFToneChangeEvent:A.h,RTCPeerConnectionIceEvent:A.h,RTCTrackEvent:A.h,SecurityPolicyViolationEvent:A.h,SensorErrorEvent:A.h,SpeechRecognitionError:A.h,SpeechRecognitionEvent:A.h,SpeechSynthesisEvent:A.h,StorageEvent:A.h,SyncEvent:A.h,TextEvent:A.h,TouchEvent:A.h,TrackEvent:A.h,TransitionEvent:A.h,WebKitTransitionEvent:A.h,UIEvent:A.h,VRDeviceEvent:A.h,VRDisplayEvent:A.h,VRSessionEvent:A.h,WheelEvent:A.h,MojoInterfaceRequestEvent:A.h,ResourceProgressEvent:A.h,USBConnectionEvent:A.h,IDBVersionChangeEvent:A.h,AudioProcessingEvent:A.h,OfflineAudioCompletionEvent:A.h,WebGLContextEvent:A.h,Event:A.h,InputEvent:A.h,SubmitEvent:A.h,EventTarget:A.aA,File:A.bK,MessageEvent:A.aH,MessagePort:A.aW,ServiceWorkerGlobalScope:A.b4,SharedWorkerGlobalScope:A.b4,WorkerGlobalScope:A.b4})
hunkHelpers.setOrUpdateLeafTags({DOMError:true,MediaError:true,MessageChannel:true,NavigatorUserMediaError:true,OverconstrainedError:true,PositionError:true,GeolocationPositionError:true,ArrayBuffer:true,DataView:true,ArrayBufferView:false,Float32Array:true,Float64Array:true,Int16Array:true,Int32Array:true,Int8Array:true,Uint16Array:true,Uint32Array:true,Uint8ClampedArray:true,CanvasPixelArray:true,Uint8Array:false,Blob:false,DedicatedWorkerGlobalScope:true,DOMException:true,AbortPaymentEvent:true,AnimationEvent:true,AnimationPlaybackEvent:true,ApplicationCacheErrorEvent:true,BackgroundFetchClickEvent:true,BackgroundFetchEvent:true,BackgroundFetchFailEvent:true,BackgroundFetchedEvent:true,BeforeInstallPromptEvent:true,BeforeUnloadEvent:true,BlobEvent:true,CanMakePaymentEvent:true,ClipboardEvent:true,CloseEvent:true,CompositionEvent:true,CustomEvent:true,DeviceMotionEvent:true,DeviceOrientationEvent:true,ErrorEvent:true,ExtendableEvent:true,ExtendableMessageEvent:true,FetchEvent:true,FocusEvent:true,FontFaceSetLoadEvent:true,ForeignFetchEvent:true,GamepadEvent:true,HashChangeEvent:true,InstallEvent:true,KeyboardEvent:true,MediaEncryptedEvent:true,MediaKeyMessageEvent:true,MediaQueryListEvent:true,MediaStreamEvent:true,MediaStreamTrackEvent:true,MIDIConnectionEvent:true,MIDIMessageEvent:true,MouseEvent:true,DragEvent:true,MutationEvent:true,NotificationEvent:true,PageTransitionEvent:true,PaymentRequestEvent:true,PaymentRequestUpdateEvent:true,PointerEvent:true,PopStateEvent:true,PresentationConnectionAvailableEvent:true,PresentationConnectionCloseEvent:true,ProgressEvent:true,PromiseRejectionEvent:true,PushEvent:true,RTCDataChannelEvent:true,RTCDTMFToneChangeEvent:true,RTCPeerConnectionIceEvent:true,RTCTrackEvent:true,SecurityPolicyViolationEvent:true,SensorErrorEvent:true,SpeechRecognitionError:true,SpeechRecognitionEvent:true,SpeechSynthesisEvent:true,StorageEvent:true,SyncEvent:true,TextEvent:true,TouchEvent:true,TrackEvent:true,TransitionEvent:true,WebKitTransitionEvent:true,UIEvent:true,VRDeviceEvent:true,VRDisplayEvent:true,VRSessionEvent:true,WheelEvent:true,MojoInterfaceRequestEvent:true,ResourceProgressEvent:true,USBConnectionEvent:true,IDBVersionChangeEvent:true,AudioProcessingEvent:true,OfflineAudioCompletionEvent:true,WebGLContextEvent:true,Event:false,InputEvent:false,SubmitEvent:false,EventTarget:false,File:true,MessageEvent:true,MessagePort:true,ServiceWorkerGlobalScope:true,SharedWorkerGlobalScope:true,WorkerGlobalScope:false})
A.Q.$nativeSuperclassTag="ArrayBufferView"
A.d_.$nativeSuperclassTag="ArrayBufferView"
A.d0.$nativeSuperclassTag="ArrayBufferView"
A.aX.$nativeSuperclassTag="ArrayBufferView"
A.d1.$nativeSuperclassTag="ArrayBufferView"
A.d2.$nativeSuperclassTag="ArrayBufferView"
A.ac.$nativeSuperclassTag="ArrayBufferView"})()
convertAllToFastObject(w)
convertToFastObject($);(function(a){if(typeof document==="undefined"){a(null)
return}if(typeof document.currentScript!="undefined"){a(document.currentScript)
return}var s=document.scripts
function onLoad(b){for(var q=0;q<s.length;++q)s[q].removeEventListener("load",onLoad,false)
a(b.target)}for(var r=0;r<s.length;++r)s[r].addEventListener("load",onLoad,false)})(function(a){v.currentScript=a
var s=A.p2
if(typeof dartMainRunner==="function")dartMainRunner(s,[])
else s([])})})()
//# sourceMappingURL=colors_web_worker.dart.js.map
