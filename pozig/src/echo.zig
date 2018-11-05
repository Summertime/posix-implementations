const std = @import("std");
const io = std.io;
const os = std.os;
const allocator = std.debug.global_allocator;

pub fn main() !void {
    var stdout_file = try io.getStdOut();

    var args = os.args();
    const exe = try ?? args.next(allocator);
    var spacing = false;
    while (args.next(allocator)) |arg_or_err| {
        var arg = try arg_or_err;
        if (spacing) {
            try stdout_file.write(" ");
        } else {
            spacing = true;
        }
        try stdout_file.write(arg);
    }
    try stdout_file.write("\n");
}
