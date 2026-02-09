package hello

import "testing"

func TestMessage(t *testing.T) {
	if got := Message(); got != "Hello World!" {
		t.Fatalf("expected %q, got %q", "Hello World!", got)
	}
}
