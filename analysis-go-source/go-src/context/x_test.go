// Copyright 2016 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package context_test

import (
	"testing"

	"thinkgos.cn/go/context"
)

func TestBackground(t *testing.T)               { context.XTestBackground(t) }
func TestTODO(t *testing.T)                     { context.XTestTODO(t) }
func TestWithCancel(t *testing.T)               { context.XTestWithCancel(t) }
func TestParentFinishesChild(t *testing.T)      { context.XTestParentFinishesChild(t) }
func TestChildFinishesFirst(t *testing.T)       { context.XTestChildFinishesFirst(t) }
func TestDeadline(t *testing.T)                 { context.XTestDeadline(t) }
func TestTimeout(t *testing.T)                  { context.XTestTimeout(t) }
func TestCanceledTimeout(t *testing.T)          { context.XTestCanceledTimeout(t) }
func TestValues(t *testing.T)                   { context.XTestValues(t) }
func TestAllocs(t *testing.T)                   { context.XTestAllocs(t, testing.Short, testing.AllocsPerRun) }
func TestSimultaneousCancels(t *testing.T)      { context.XTestSimultaneousCancels(t) }
func TestInterlockedCancels(t *testing.T)       { context.XTestInterlockedCancels(t) }
func TestLayersCancel(t *testing.T)             { context.XTestLayersCancel(t) }
func TestLayersTimeout(t *testing.T)            { context.XTestLayersTimeout(t) }
func TestCancelRemoves(t *testing.T)            { context.XTestCancelRemoves(t) }
func TestWithCancelCanceledParent(t *testing.T) { context.XTestWithCancelCanceledParent(t) }
func TestWithValueChecksKey(t *testing.T)       { context.XTestWithValueChecksKey(t) }
func TestInvalidDerivedFail(t *testing.T)       { context.XTestInvalidDerivedFail(t) }
func TestDeadlineExceededSupportsTimeout(t *testing.T) {
	context.XTestDeadlineExceededSupportsTimeout(t)
}
func TestCustomContextGoroutines(t *testing.T) { context.XTestCustomContextGoroutines(t) }
