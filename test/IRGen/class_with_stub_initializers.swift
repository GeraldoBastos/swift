// RUN: rm -rf %t/clang-module-cache
// RUN: %swift -target x86_64-apple-macosx10.9 -module-cache-path %t/clang-module-cache -sdk %S/Inputs -I=%S/Inputs -enable-source-import %s -emit-ir | FileCheck %s

import Foundation

// CHECK:       @_TMd[[FOO:C28class_with_stub_initializers3Foo]] = 
// -- The init() stub should get no vtable entry
// CHECK-NOT:     %[[FOO]]* (%[[FOO]]*)*
// CHECK:         %[[FOO]]* (i64, %[[FOO]]*)*
// -- The init() stub should get no vtable entry
// CHECK-NOT:     %[[FOO]]* (%[[FOO]]*)*
class Foo: NSObject {
  init(x: Int) { super.init() }
}
