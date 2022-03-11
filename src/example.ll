; ModuleID = 'main_module'
source_filename = "main_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-none-unknown-elf"

%"struct.Stivale2::Struct" = type { [64 x i8], [64 x i8], %"struct.Stivale2::Tag"* }
%"struct.Stivale2::Tag" = type { i64, %"struct.Stivale2::Tag"* }

@ARGV_UNSAFE = internal unnamed_addr global i8** null

; Function Attrs: nounwind
define void @__crystal_main(i32 %argc, i8** %argv) local_unnamed_addr #0 !dbg !4 {
alloca:
  %stack = alloca [8192 x i8], align 1, !dbg !9
  store i8** %argv, i8*** @ARGV_UNSAFE, align 8, !dbg !12
  tail call void asm ".section .stivale2hdr", ""() #0, !dbg !14
  %0 = ptrtoint [8192 x i8]* %stack to i64, !dbg !15
  %1 = zext i64 %0 to i65, !dbg !16
  %2 = call { i65, i1 } @llvm.sadd.with.overflow.i65(i65 %1, i65 8192), !dbg !16
  %3 = extractvalue { i65, i1 } %2, 0, !dbg !16
  %4 = extractvalue { i65, i1 } %2, 1, !dbg !16
  %5 = icmp sgt i65 %3, -1, !dbg !16
  %6 = xor i1 %4, true, !dbg !16
  call void @llvm.assume(i1 %6), !dbg !16
  call void @llvm.assume(i1 %5), !dbg !16
  call void asm ".section .text", ""() #0, !dbg !17
  ret void, !dbg !17
}

; Function Attrs: nounwind uwtable
define void @__crystal_raise(i8* nocapture readnone %unwind_ex) local_unnamed_addr #1 !dbg !18 {
entry:
  tail call void asm "hlt", ""() #0, !dbg !20
  ret void, !dbg !20
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn
define void @__crystal_raise_overflow() local_unnamed_addr #2 !dbg !21 {
entry:
  ret void, !dbg !22
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn
define i64 @__crystal_get_exception(i8* nocapture readnone %unwind_ex) local_unnamed_addr #2 !dbg !23 {
entry:
  ret i64 0, !dbg !24
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn
define noalias i8* @__crystal_once_init() local_unnamed_addr #2 !dbg !25 {
entry:
  ret i8* null, !dbg !26
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn
define void @__crystal_once(i8* nocapture readnone %state, i1* nocapture %flag, i8* nocapture readnone %initializer) local_unnamed_addr #3 !dbg !27 {
alloca:
  %0 = load i1, i1* %flag, align 1, !dbg !28
  br i1 %0, label %exit, label %else, !dbg !28

else:                                             ; preds = %alloca
  store i1 true, i1* %flag, align 1, !dbg !28
  br label %exit, !dbg !28

exit:                                             ; preds = %alloca, %else
  ret void, !dbg !28
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn
define void @__crystal_personality() local_unnamed_addr #2 !dbg !29 {
entry:
  ret void, !dbg !30
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare { i65, i1 } @llvm.sadd.with.overflow.i65(i65, i65) #4

; Function Attrs: uwtable
define void @_start(%"struct.Stivale2::Struct"* readonly byval(%"struct.Stivale2::Struct") %stivale) local_unnamed_addr #5 !dbg !31 {
alloca:
  %.elt25 = getelementptr inbounds %"struct.Stivale2::Struct", %"struct.Stivale2::Struct"* %stivale, i64 0, i32 2, !dbg !32
  br label %while.i, !dbg !33

while.i:                                          ; preds = %while.i, %alloca
  %current_tag.0.i.in = phi %"struct.Stivale2::Tag"** [ %.elt25, %alloca ], [ %.elt259.i, %while.i ]
  %current_tag.0.i = load %"struct.Stivale2::Tag"*, %"struct.Stivale2::Tag"** %current_tag.0.i.in, align 8, !dbg !36
  %.elt.i = getelementptr inbounds %"struct.Stivale2::Tag", %"struct.Stivale2::Tag"* %current_tag.0.i, i64 0, i32 0, !dbg !37
  %.unpack.i = load i64, i64* %.elt.i, align 8, !dbg !37
  %.elt259.i = getelementptr inbounds %"struct.Stivale2::Tag", %"struct.Stivale2::Tag"* %current_tag.0.i, i64 0, i32 1, !dbg !37
  %0 = icmp ne i64 %.unpack.i, -4416917690573452940, !dbg !38
  call void @llvm.assume(i1 %0), !dbg !38
  br label %while.i, !dbg !38
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #6

attributes #0 = { nounwind }
attributes #1 = { nounwind uwtable }
attributes #2 = { mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn }
attributes #3 = { mustprogress nofree norecurse nosync nounwind uwtable willreturn }
attributes #4 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { uwtable }
attributes #6 = { inaccessiblememonly nofree nosync nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "Crystal", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "main_module", directory: ".")
!2 = !{}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = distinct !DISubprogram(name: "__crystal_main", linkageName: "__crystal_main", scope: !5, file: !5, type: !6, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!5 = !DIFile(filename: "??", directory: ".")
!6 = !DISubroutineType(types: !7)
!7 = !{!8}
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DILocation(line: 1, column: 1, scope: !10)
!10 = distinct !DILexicalBlock(scope: !4, file: !11, line: 1, column: 1)
!11 = !DIFile(filename: "example.cr", directory: "/data/data/com.termux/files/home/crystal-stivale2/src")
!12 = !DILocation(line: 0, scope: !13)
!13 = distinct !DILexicalBlock(scope: !4, file: !5, line: 1, column: 1)
!14 = !DILocation(line: 12, column: 1, scope: !10)
!15 = !DILocation(line: 21, column: 1, scope: !10)
!16 = !DILocation(line: 23, column: 57, scope: !10)
!17 = !DILocation(line: 24, column: 58, scope: !10)
!18 = distinct !DISubprogram(name: "__crystal_raise", linkageName: "__crystal_raise", scope: !19, file: !19, line: 16, type: !6, scopeLine: 16, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "panic.cr", directory: "/data/data/com.termux/files/home/crystal-stivale2/src/prelude/crystal_core")
!20 = !DILocation(line: 16, column: 1, scope: !18)
!21 = distinct !DISubprogram(name: "__crystal_raise_overflow", linkageName: "__crystal_raise_overflow", scope: !19, file: !19, line: 23, type: !6, scopeLine: 23, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!22 = !DILocation(line: 23, column: 1, scope: !21)
!23 = distinct !DISubprogram(name: "__crystal_get_exception", linkageName: "__crystal_get_exception", scope: !19, file: !19, line: 29, type: !6, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!24 = !DILocation(line: 29, column: 1, scope: !23)
!25 = distinct !DISubprogram(name: "__crystal_once_init", linkageName: "__crystal_once_init", scope: !11, file: !11, line: 45, type: !6, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!26 = !DILocation(line: 46, column: 3, scope: !25)
!27 = distinct !DISubprogram(name: "__crystal_once", linkageName: "__crystal_once", scope: !11, file: !11, line: 49, type: !6, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!28 = !DILocation(line: 50, column: 3, scope: !27)
!29 = distinct !DISubprogram(name: "__crystal_personality", linkageName: "__crystal_personality", scope: !11, file: !11, line: 55, type: !6, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!30 = !DILocation(line: 55, column: 1, scope: !29)
!31 = distinct !DISubprogram(name: "_start", linkageName: "_start", scope: !11, file: !11, line: 40, type: !6, scopeLine: 40, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!32 = !DILocation(line: 40, column: 1, scope: !31)
!33 = !DILocation(line: 29, column: 3, scope: !34, inlinedAt: !35)
!34 = distinct !DISubprogram(name: "get_tag", linkageName: "get_tag", scope: !11, file: !11, line: 28, type: !6, scopeLine: 28, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!35 = distinct !DILocation(line: 41, column: 18, scope: !31)
!36 = !DILocation(line: 0, scope: !34, inlinedAt: !35)
!37 = !DILocation(line: 32, column: 5, scope: !34, inlinedAt: !35)
!38 = !DILocation(line: 33, column: 5, scope: !34, inlinedAt: !35)
