cmd = torch.CmdLine()
cmd:text()
cmd:text()
cmd:text('Color2Gray: Salience-Preserving Color Removal')
cmd:text()
cmd:text('Options')
cmd:option('-inp',          'color.png',    'path to the input image')
cmd:option('-oup',          'gray.png',     'path to the output image')
cmd:option('-batchsize',    1,              'the number of images in a mini-batch')
cmd:option('-iter',         5,              'the number of iterations')
cmd:option('-LR',           0.1,            'learning rate(if applicable)')
cmd:option('-momentum',     0.5,            'momentum(if applicable)')
cmd:option('-theta',        45,             'whether chromatic differences are mapped to increases or decreases in luminance value')
cmd:option('-alpha',        10,             'how much chromatic variation is allowed to change the source luminance value')
cmd:option('-test',         false,          'whether to use naive implmentation as a double-check')
cmd:option('-optimAlgo', 'cg',              'optimization algorithm: cg, lbfgs, etc.')
cmd:text()

opts = cmd:parse(arg)

opts.rundir = cmd:string('experiment', opts, {dir=true})
paths.mkdir(opts.rundir)
cmd:log(opts.rundir .. '/log', opts)

opts.optimAlgo = optim[opts.optimAlgo]