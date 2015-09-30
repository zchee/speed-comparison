a=[0]*256
b="./python-2.7.2-macosx10.6.dmg"
f=open(b)
s=f.read()
f.close()
for c in s:
    a[ord(c)] += 1
print("   "),
for n in range(0,8):
    print("%8x"%n),
for n in range(0,256):
    if n%8 == 0:
        print("\n%02x "%n),
    print("%8d"%a[n]),
