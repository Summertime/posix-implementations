const std = @import("std");
const io = std.io;
const os = std.os;

pub fn main() u8 {
    main2() catch |err| {
        return 1;
    };
    return 0;
}

fn main2() !void {
    var stdout_file = try io.getStdOut();
    var args = os.args();
    const exe = args.nextPosix();
    var spacing = false;
    while (args.nextPosix()) |arg| {
        if (spacing) {
            try stdout_file.write(" ");
        } else {
            spacing = true;
        }
        try stdout_file.write(arg);
    }
    try stdout_file.write("\n");
}
